import sys
import getopt
import socket
import struct
import time
import threading
import BasicSender
import Checksum

class Sender(BasicSender.BasicSender):
    def __init__(self, dest, port, filename, debug=False, sackMode=False):
        super(Sender, self).__init__(dest, port, filename, debug)
        if sackMode:
            raise NotImplementedError
        self.sackMode = sackMode
        self.base = 0
        self.next_seqno = 0
        self.window_size = 5
        self.window = []

    def start(self):
        self.log("Sending started.")

        # Establish connection by sending the initial start packet
        start_packet = self.make_packet('start', self.base, '')
        self.send(start_packet)
        self.log(f"Sent start packet {self.base}")

        # Wait for ACK or handle timeout
        ack_thread = threading.Thread(target=self.receive_ack)
        ack_thread.start()
        ack_thread.join()

        # Split the entire message into chunks
        max_rudp_packet_size = 1472
        chunks = [self.message[i:i + max_rudp_packet_size] for i in range(0, len(self.message), max_rudp_packet_size)]

        # Send each chunk as a separate RUDP packet
        for seqno, chunk in enumerate(chunks):
            msg_type = 'data' if seqno != len(chunks) - 1 else 'end'
            packet = self.make_packet(msg_type, seqno, chunk)
            self.send(packet)
            self.log(f"Sent packet {seqno + self.base}, chunk {seqno + 1}/{len(chunks)}")

            # Wait for ACK or handle timeout
            ack_thread = threading.Thread(target=self.receive_ack)
            ack_thread.start()
            ack_thread.join()

    def send_packet(self, seqno):
        if seqno < len(self.message):
            data = self.message[seqno]
            msg_type = 'data' if seqno != len(self.message) - 1 else 'end'
            packet = self.make_packet(msg_type, seqno, data)
            self.send(packet)
            self.log(f"Sent packet {seqno}")

    def receive_ack(self):
        try:
            ack, _ = self.receive()
            ack_parts = ack.decode('utf-8').split('|')

            if len(ack_parts) == 3 and ack_parts[0] == 'ack':
                ack_seqno = int(ack_parts[1])
                ack_checksum = int(ack_parts[2])

                # Recalculate the checksum for validation
                recalculated_checksum = Checksum.generate_checksum(struct.pack('I', ack_seqno))

                if recalculated_checksum == ack_checksum and ack_seqno >= self.base:
                    self.handle_new_ack(ack_seqno)
                else:
                    self.handle_dup_ack(ack_seqno)
            else:
                self.log(f"Illegal ACK format: {ack}")
        except socket.timeout:
            self.handle_timeout()

    def handle_timeout(self):
        self.log("Timeout! Retransmitting...")
        self.next_seqno = self.base

    def handle_new_ack(self, ack_seqno):
        self.log(f"Received ACK: {ack_seqno}")
        self.base = ack_seqno + 1
        self.next_seqno = max(self.next_seqno, self.base)

    def handle_dup_ack(self, ack_seqno):
        self.log(f"Received duplicate ACK: {ack_seqno}")
        self.send_packet(ack_seqno)

    def make_packet(self, msg_type, seqno, data):
        header = struct.pack('I', seqno)
        payload = data.encode('utf-8') if msg_type in ['start', 'data',
                                                       'end'] else b''  # Convert data to bytes for encoding
        checksum_data = header + payload
        checksum = Checksum.generate_checksum(checksum_data)

        if msg_type == 'start':
            return f"{msg_type}|{seqno}|{data}|{checksum}".encode('utf-8')
        elif msg_type == 'data':
            return f"{msg_type}|{seqno}|{data}|{checksum}".encode('utf-8')
        elif msg_type == 'end':
            return f"{msg_type}|{seqno}|{data}|{checksum}".encode('utf-8')
        elif msg_type == 'ack':
            return f"{msg_type}|{seqno}|{checksum}".encode('utf-8')

    def send(self, packet):
        super(Sender, self).send(packet)

    def log(self, msg):
        if self.debug:
            print(msg)

if __name__ == "__main__":
    def usage():
        print("RUDP Sender")
        print("-f FILE | --file=FILE The file to transfer; if empty reads from STDIN")
        print("-p PORT | --port=PORT The destination port, defaults to 33122")
        print("-a ADDRESS | --address=ADDRESS The receiver address or hostname, defaults to localhost")
        print("-d | --debug Print debug messages")
        print("-h | --help Print this usage message")
        print("-k | --sack Enable selective acknowledgement mode")

    try:
        opts, args = getopt.getopt(sys.argv[1:],
                                   "f:p:a:dk", ["file=", "port=", "address=", "debug=", "sack="])
    except getopt.GetoptError:
        usage()
        sys.exit(2)

    port = 33122
    dest = "localhost"
    filename = None
    debug = False
    sackMode = False

    for o, a in opts:
        if o in ("-f", "--file="):
            filename = a
        elif o in ("-p", "--port="):
            port = int(a)
        elif o in ("-a", "--address="):
            dest = a
        elif o in ("-d", "--debug="):
            debug = True
        elif o in ("-k", "--sack="):
            sackMode = True

    s = Sender(dest, port, filename, debug, sackMode)
    try:
        s.start()
    except (KeyboardInterrupt, SystemExit):
        exit()
