import random

from tests.BasicTest import BasicTest

class RepeatTest(BasicTest):
    def handle_packet(self):
        for p in self.forwarder.in_queue:
            # 模拟重复，以30%的概率将包复制一次
            self.forwarder.out_queue.append(p)
            if random.random() < 0.3:
                self.forwarder.out_queue.append(p)
        # empty out the in_queue
        self.forwarder.in_queue = []