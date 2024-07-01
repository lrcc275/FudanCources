import cv2
import numpy as np
import sys
import copy

def estimate_A(img, DarkImg):
    h,w = DarkImg.shape[0] , DarkImg.shape[1]
    PixelsNum = h * w
    TopNum = int(PixelsNum * 0.001)
    pixels = []
    for i in range(h):
        for j in range(w):
            pixels.append(DarkImg[i][j])
    pixels_id = sorted(range(len(pixels)), key=lambda j: pixels[j])
    AtmosphericLight = np.zeros(3)
    for i in range(len(pixels) - TopNum, len(pixels)):
        pixel_index = pixels_id[i]
        row_of_pixel = pixel_index // w
        column_of_pixel = pixel_index % w
        # 对原图像的三个通道进行比较，保存最大值
        for channel in range(3):
            pixel_value = img[row_of_pixel, column_of_pixel, channel]
            if pixel_value > AtmosphericLight[channel]:
                AtmosphericLight[channel] = pixel_value
    return AtmosphericLight

# 计算图像的暗通道d
def ComputeDarkChannel(img, size=15):
    r, g, b = cv2.split(img)
    MinImg = cv2.min(r, cv2.min(g, b))
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (size, size))
    DarkImg = cv2.erode(MinImg, kernel)
    return DarkImg

# 导向滤波
def GuidedFilter(p, i, r, e):
    mean_I = cv2.boxFilter(i, cv2.CV_64F, (r, r))
    mean_p = cv2.boxFilter(p, cv2.CV_64F, (r, r))
    corr_I = cv2.boxFilter(i * i, cv2.CV_64F, (r, r))
    corr_Ip = cv2.boxFilter(i * p, cv2.CV_64F, (r, r))
    var_I = corr_I - mean_I * mean_I
    cov_Ip = corr_Ip - mean_I * mean_p
    a = cov_Ip / (var_I + e)
    b = mean_p - a * mean_I
    mean_a = cv2.boxFilter(a, cv2.CV_64F, (r, r))
    mean_b = cv2.boxFilter(b, cv2.CV_64F, (r, r))
    q = mean_a * i + mean_b
    return q

# 去雾步骤
def dehaze(img):
    DarkPrior = ComputeDarkChannel(img)
    cv2.imwrite("DarkPrior_of_01_outdoor_2.jpg",DarkPrior)
    A = estimate_A(img,DarkPrior)
    t = img / A
    t_min = ComputeDarkChannel(t)
    img_gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY).astype('float64') / 255
    t_min = GuidedFilter(t_min, img_gray, 225, 0.0001)
    a,b = t_min.shape[1],t_min.shape[0]
    t_x = [[0 for i in range(a)] for i in range(b)]
    for i in range(b):
        for j in range(a):
            t_x[i][j] = 1 - 0.95 * t_min[i][j]

    RestoreImg = copy.copy(img)
    for i in range(RestoreImg.shape[0]):
        for j in range(RestoreImg.shape[1]):
            RestoreImg[i][j][0] = max(min((int(img[i][j][0]) - int(A[0])) / max(0.1, t_x[i][j]) + int(A[0]), 255), 0)
            RestoreImg[i][j][1] = max(min((int(img[i][j][1]) - int(A[1])) / max(0.1, t_x[i][j]) + int(A[1]), 255), 0)
            RestoreImg[i][j][2] = max(min((int(img[i][j][2]) - int(A[2])) / max(0.1, t_x[i][j]) + int(A[2]), 255), 0)
    RestoreImg = ColorCorrect(RestoreImg,2.2)
    return RestoreImg

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


def dehaze_baseline(image):
    RestoreImg = dehaze(image)
    return RestoreImg

if __name__ == '__main__':
    image = cv2.imread('Self-selected-pictures/p3.jpg')
    RestoreImg = dehaze(image)
    cv2.imshow("result", RestoreImg)
    cv2.waitKey(0)