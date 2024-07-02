import getopt
import threading
import time
import sys
import Checksum
from BasicSender import BasicSender

getMiliTime = lambda: int(round(time.time() * 1000))

class Sender(BasicSender):
    def log(self, msg):
        if self.debug:
            print(msg)

    def __init__(self, dest, port, filename, debug=True, sackMode=False):
        super(Sender, self).__init__(dest, port, filename, debug)
        self.sackMode = sackMode
        self.seqNumLock = threading.Lock()
        self.noMoreAckLock = threading.Lock()
        self.lastAckSeqNum = -1
        self.lastAckChanged = False
        self.noMoreAck = False
        self.finished = False
        self.finishedLock = threading.Lock()
        self.datas = self.read_all()
        self.max_iter = len(self.datas)
        self.infile.close()
        if sackMode:
            raise NotImplementedError

    def read_all(self):
        d = self.infile.read()
        chunk_size = 1472
        chunks = [d[i:i + chunk_size] for i in range(0, len(d), chunk_size)]
        return chunks

    def ACKReceiver(self):
        while True:
            with self.noMoreAckLock:
                if self.noMoreAck:
                    return
            try:
                ackMessage = self.receive()
            except:
                pass
            if ackMessage != None:
                ackMsg = ackMessage.decode()
                msg_type, ack_seq, _, _ = self.split_packet(ackMsg)
                with self.seqNumLock:
                    ack_seq = int(ack_seq)
                    ackDiff = ack_seq - self.lastAckSeqNum
                    if ackDiff > 0:
                        self.lastAckSeqNum = ack_seq
                        self.lastAckChanged = True
                    if ack_seq >= self.max_iter:
                        with self.finishedLock:
                            self.finished = True
                        with self.noMoreAckLock:
                            self.noMoreAck = True


    def sendPackets(self, pkglists):
        baseSeqNum = 0
        baseIdxNum = 0
        currentPkgIdx = 0
        receiver = threading.Thread(target=self.ACKReceiver)
        receiver.daemon = True
        receiver.start()

        firstRun = True
        pause = False
        packageTimerStart = getMiliTime()

        while baseSeqNum < len(pkglists) and not self.finished:
            with self.seqNumLock:
                if self.lastAckChanged:
                    self.lastAckChanged = False
                    newBase = self.lastAckSeqNum
                    diff = newBase - baseSeqNum
                    baseIdxNum += diff
                    baseSeqNum = newBase
                    packageTimerStart = getMiliTime()

            if firstRun:
                packageTimerStart = getMiliTime()
                firstRun = False

            if getMiliTime() - packageTimerStart > 500:
                currentPkgIdx = baseIdxNum
                packageTimerStart = getMiliTime()
                pause = False

            if not pause:
                msg_type = "start" if currentPkgIdx == 0 else "end" if currentPkgIdx == self.max_iter - 1 else "data"
                packet = self.make_packet(msg_type, currentPkgIdx, pkglists[currentPkgIdx])
                self.send(packet)
                self.log("Sending packet {0}".format(currentPkgIdx))

            currentPkgIdx += 1
            pause = currentPkgIdx >= len(pkglists) or currentPkgIdx >= baseIdxNum + 5

        receiver.join()

    def start(self):
        self.sendPackets(self.datas)


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
    except:
        usage()
        exit()

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