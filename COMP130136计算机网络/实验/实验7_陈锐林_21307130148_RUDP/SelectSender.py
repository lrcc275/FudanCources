
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
        self.lastAckSeqNum = -1
        self.lastAckChanged = False
        self.finished = False
        self.finishedLock = threading.Lock()
        self.datas = self.read_all()
        self.max_iter = len(self.datas)
        self.infile.close()

    def read_all(self):
        # 读取文件内容并分割成数据包
        d = self.infile.read()
        chunk_size = 1472
        chunks = [d[i:i + chunk_size] for i in range(0, len(d), chunk_size)]
        return chunks

    def ACKReceiver(self):
        # 用于接收ACK的线程
        while True:
            self.seqNumLock.acquire()
            # 检查是否已完成
            if self.finished:
                self.seqNumLock.release()
                return
            self.seqNumLock.release()
            try:
                ackMessage = self.receive()
            except:
                pass
            ackMsg = ackMessage.decode()
            msg_type, ack_seq, data, cchecksum = self.split_packet(ackMsg)
            self.seqNumLock.acquire()
            ack_seq = int(ack_seq)
            # 如果收到新的ACK，更新基础序列号
            if ack_seq > self.lastAckSeqNum:
                self.lastAckSeqNum = ack_seq
                self.lastAckChanged = True
            self.seqNumLock.release()

    def sendPackets(self, pkglists):
        baseSeqNum = 0
        baseIdxNum = 0
        receiver = threading.Thread(target=self.ACKReceiver)
        receiver.daemon = True
        receiver.start()

        while baseSeqNum < len(pkglists):
            self.seqNumLock.acquire()
            # 如果收到新的ACK，更新基础序列号和索引号
            if self.lastAckChanged:
                newBase = self.lastAckSeqNum + 1
                diff = newBase - baseSeqNum
                baseIdxNum += diff
                baseSeqNum = newBase
                self.lastAckChanged = False
            self.seqNumLock.release()

            currentPkgIdx = baseIdxNum
            while currentPkgIdx < min(len(pkglists), baseIdxNum + 5):
                # 发送数据包
                if not self.finished:
                    msg_type = "data" if currentPkgIdx != self.max_iter - 1 else "end"
                    packet = self.make_packet(msg_type, currentPkgIdx, pkglists[currentPkgIdx])
                    self.send(packet)
                    self.log("发送数据包 {0}".format(currentPkgIdx))
                currentPkgIdx += 1

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
