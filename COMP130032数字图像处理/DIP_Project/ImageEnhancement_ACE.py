import cv2
import numpy as np

#计算在求色差时所需要的距离权重
d = {}
def ComputeDist(omega=5):
    global d
    _d = d.get(omega,None)
    if _d is not None:
        return _d
    sz = omega * 2 + 1
    _d = np.zeros((sz,sz))
    for a in range(-omega,omega + 1):
        for b in range(-omega,omega + 1):
            if a != 0 or b != 0:
                _d[omega + a,omega + b] = 1.0 / np.sqrt(a ** 2 + b ** 2)
    _d /= _d.sum()
    d[omega] = _d
    return _d

#队R(x)进行拓展
def Stretch(data, s=0.005, bins=2000):
    ht = np.histogram(data, bins)
    percent = np.cumsum(ht[0]) / float(data.size)
    ind_min, ind_max = 0 , bins - 1
    while ind_min < bins:
        if percent[ind_min] >= s:
            break
        ind_min += 1
    while ind_max >= 0:
        if percent[ind_max] <= 1 - s:
            break
        ind_max -= 1
    return np.clip((data - ht[1][ind_min]) / (ht[1][ind_max] - ht[1][ind_min]), 0, 1)



#较慢的ACE
def Ace(image, alpha=4, omega=300):
    dist = ComputeDist(omega)
    h, w = image.shape
    zh = [0] * omega + [x for x in range(h)] + [h - 1] * omega
    zw = [0] * omega + [x for x in range(w)] + [w - 1] * omega
    choosed = image[np.ix_(zh, zw)]
    res = np.zeros(image.shape)
    sz = omega * 2 + 1
    for a in range(sz):
        for b in range(sz):
            if dist[a][b] != 0:
                res += (dist[a][b] * np.clip((image - choosed[a:a + h, b:b + w]) * alpha, -1, 1))
    return res


#快速ACE
def AceFast(image, alpha, omega):
    h,w = image.shape[:2]
    if min(h, w) <= 2:
        return np.zeros(image.shape) + 0.5
    image_resized = cv2.resize(image, (int((w + 1) / 2), int((h + 1) / 2)))
    HalfI = AceFast(image_resized, alpha, omega)
    HalfI = cv2.resize(HalfI, (w, h))
    image_resized = cv2.resize(image_resized, (w, h))
    return HalfI + Ace(image, alpha, omega) - Ace(image_resized, alpha, omega)

#整合结果
def dehaze(image, alpha=4, omega=3):
    RestoreImg = np.zeros(image.shape)
    RestoreImg[:, :, 0] = Stretch(AceFast(image[:, :, 0], alpha, omega))
    RestoreImg[:, :, 1] = Stretch(AceFast(image[:, :, 1], alpha, omega))
    RestoreImg[:, :, 2] = Stretch(AceFast(image[:, :, 2], alpha, omega))
    return RestoreImg

#用于evaluate函数调用
def dehaze_ACE(img):
    res = dehaze(img / 255) * 255
    cv2.imwrite('result.jpg', res)
    r = cv2.imread('result.jpg')
    return r

if __name__ == '__main__':
    img = cv2.imread('Self-selected-pictures/O-HAZY-example.jpg')
    res = dehaze_ACE(img)
    cv2.imshow("res",res)
    cv2.waitKey(0)