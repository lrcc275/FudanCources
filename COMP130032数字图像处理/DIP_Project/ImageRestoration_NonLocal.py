import cv2
import numpy as np
from sklearn.neighbors import KDTree
import copy
import time

#返回KDTree查询结果
def KdtreeCluster(nodes):
    h, w = nodes.shape[0:2]
    data = np.loadtxt('NonLocal_Data.txt')
    tree = KDTree(data)
    nodes = np.reshape(nodes, (h * w, -1))
    _,index = tree.query(nodes, k=1)
    return np.reshape(index, (h, w))

#计算并纠正透射率t
def TransMoidfy(img, dist, labels, A, K=1000):
    t = copy.deepcopy(dist)
    for i in range(K):
        mask = np.where(labels == i)
        if mask[0].shape[0] > 0:
            max_rad = max(dist[mask])
            t[mask] /= max_rad
    t_min = 0.1
    t = np.minimum(np.maximum(t, t_min), 1)  #归化到[t_min,1]
    t = np.maximum(t, 1 - np.min(img / A, axis=2))
    filter = GuidedFilter(img, radius = 60, epsilon= 10 ** -3)
    t = filter.filter(t)
    return t

#去雾流程
def dehaze(haze_img):
    img = copy.deepcopy(haze_img) / float(255)
    A = estimate_A(haze_img) / 255
    h, w, channel = haze_img.shape
    haze_img = haze_img / 255

    dist = np.zeros_like(haze_img)
    radius = np.zeros((h, w), dtype=np.float64)

    for index in range(channel):
        dist[:, :, index] = haze_img[:, :, index] - A
        radius += np.power(dist[:, :, index], 2)

    radius = np.sqrt(radius + 0.000001)
    r = copy.deepcopy(radius)
    radius = cv2.merge((radius, radius, radius))

    nodes = dist / radius
    labels = KdtreeCluster(nodes)
    t = TransMoidfy(img, r, labels, A)
    t = cv2.merge((t, t, t))

    RestoreImg = (dist / t + A) * 255
    RestoreImg = np.clip(RestoreImg, 0, 255)
    RestoreImg = RestoreImg.astype(np.uint8)
    RestoreImg = ColorCorrect(RestoreImg,2.2)

    # cv2.imshow("res",RestoreImg)
    # cv2.waitKey(0)
    return RestoreImg

#颜色校正
def ColorCorrect(img, u):
    img = np.float64(img) / 255
    B_mse = np.std(img[:, :, 0])
    G_mse = np.std(img[:, :, 1])
    R_mse = np.std(img[:, :, 2])

    B_max = np.mean(img[:, :, 0]) + u * B_mse
    G_max = np.mean(img[:, :, 1]) + u * G_mse
    R_max = np.mean(img[:, :, 2]) + u * R_mse

    B_min = np.mean(img[:, :, 0]) - u * B_mse
    G_min = np.mean(img[:, :, 1]) - u * G_mse
    R_min = np.mean(img[:, :, 2]) - u * R_mse

    B_cr = (img[:, :, 0] - B_min) / (B_max - B_min)
    G_cr = (img[:, :, 1] - G_min) / (G_max - G_min)
    R_cr = (img[:, :, 2] - R_min) / (R_max - R_min)

    img_CR = cv2.merge([B_cr, G_cr, R_cr]) * 255
    img_CR = np.clip(img_CR, 0, 255)
    img_CR = np.uint8(img_CR)

    return img_CR

#估计大气光A same as DCP baseline
def estimate_A(m,r=15):
    MinImg = np.min(m, 2)
    DarkImg = cv2.erode(MinImg,np.ones((r,r)))
    bins = 2000
    ht = np.histogram(DarkImg, bins)
    d = np.cumsum(ht[0]) / float(DarkImg.size)
    pos = 0
    for index in range(bins - 1, 0, -1):
        if d[index] <= 0.999:
            pos = index
            break
    A = np.mean(m, 2)[DarkImg >= ht[1][pos]].max()
    return A

#导向滤波
class GuidedFilter:
    def __init__(self, I, radius=5, epsilon=0.4):
        self.R = 2 * radius + 1
        self.Epsilon = epsilon
        self.Image = self.toFloatImg(I)
        self.initFilter()

    def toFloatImg(self, img):
        if img.dtype == np.float32:
            return img
        return (1.0 / 255.0) * np.float32(img)

    def initFilter(self):
        I = self.Image
        r = self.R
        eps = self.Epsilon
        Ir, Ig, Ib = I[:, :, 0], I[:, :, 1], I[:, :, 2]

        self._Ir_mean = cv2.blur(Ir, (r, r))
        self._Ig_mean = cv2.blur(Ig, (r, r))
        self._Ib_mean = cv2.blur(Ib, (r, r))

        self._Ir_mean = cv2.blur(Ir, (r, r))
        self._Ig_mean = cv2.blur(Ig, (r, r))
        self._Ib_mean = cv2.blur(Ib, (r, r))

        Irr_var = cv2.blur(Ir ** 2, (r, r)) - self._Ir_mean ** 2 + eps
        Irg_var = cv2.blur(Ir * Ig, (r, r)) - self._Ir_mean * self._Ig_mean
        Irb_var = cv2.blur(Ir * Ib, (r, r)) - self._Ir_mean * self._Ib_mean
        Igg_var = cv2.blur(Ig * Ig, (r, r)) - self._Ig_mean * self._Ig_mean + eps
        Igb_var = cv2.blur(Ig * Ib, (r, r)) - self._Ig_mean * self._Ib_mean
        Ibb_var = cv2.blur(Ib * Ib, (r, r)) - self._Ib_mean * self._Ib_mean + eps

        Irr_inv = Igg_var * Ibb_var - Igb_var * Igb_var
        Irg_inv = Igb_var * Irb_var - Irg_var * Ibb_var
        Irb_inv = Irg_var * Igb_var - Igg_var * Irb_var
        Igg_inv = Irr_var * Ibb_var - Irb_var * Irb_var
        Igb_inv = Irb_var * Irg_var - Irr_var * Igb_var
        Ibb_inv = Irr_var * Igg_var - Irg_var * Irg_var

        I_cov = Irr_inv * Irr_var + Irg_inv * Irg_var + Irb_inv * Irb_var
        Irr_inv /= I_cov
        Irg_inv /= I_cov
        Irb_inv /= I_cov
        Igg_inv /= I_cov
        Igb_inv /= I_cov
        Ibb_inv /= I_cov

        self._Irr_inv = Irr_inv
        self._Irg_inv = Irg_inv
        self._Irb_inv = Irb_inv
        self._Igg_inv = Igg_inv
        self._Igb_inv = Igb_inv
        self._Ibb_inv = Ibb_inv

    def ComputeCoef(self, p):
        r = self.R
        I = self.Image
        Ir, Ig, Ib = I[:, :, 0], I[:, :, 1], I[:, :, 2]

        p_mean = cv2.blur(p, (r, r))
        Ipr_mean = cv2.blur(Ir * p, (r, r))
        Ipg_mean = cv2.blur(Ig * p, (r, r))
        Ipb_mean = cv2.blur(Ib * p, (r, r))

        Ipr_cov = Ipr_mean - self._Ir_mean * p_mean
        Ipg_cov = Ipg_mean - self._Ig_mean * p_mean
        Ipb_cov = Ipb_mean - self._Ib_mean * p_mean

        ar = self._Irr_inv * Ipr_cov + self._Irg_inv * Ipg_cov + self._Irb_inv * Ipb_cov
        ag = self._Irg_inv * Ipr_cov + self._Igg_inv * Ipg_cov + self._Igb_inv * Ipb_cov
        ab = self._Irb_inv * Ipr_cov + self._Igb_inv * Ipg_cov + self._Ibb_inv * Ipb_cov

        b = p_mean - ar * self._Ir_mean - ag * self._Ig_mean - ab * self._Ib_mean

        ar_mean = cv2.blur(ar, (r, r))
        ag_mean = cv2.blur(ag, (r, r))
        ab_mean = cv2.blur(ab, (r, r))
        b_mean = cv2.blur(b, (r, r))

        return ar_mean, ag_mean, ab_mean, b_mean

    def ComputeRes(self, ab, I):
        ar_mean, ag_mean, ab_mean, b_mean = ab
        Ir, Ig, Ib = I[:, :, 0], I[:, :, 1], I[:, :, 2]
        q = ar_mean * Ir + ag_mean * Ig + ab_mean * Ib + b_mean
        return q

    def filter(self, p):
        ab = self.ComputeCoef(p)
        return self.ComputeRes(ab, self.Image)

#供evaluate函数调用
def dehaze_nonlocal(img):
    dehazed_img = dehaze(img)
    return dehazed_img

if __name__ == '__main__':
    s = time.time()
    haze_img = cv2.imread('Self-selected-pictures/O-HAZY-example.jpg')
    dehazed_img = dehaze(haze_img)
    e = time.time()
    print(e - s)