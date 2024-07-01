import cv2
import numpy as np
from skimage.metrics import peak_signal_noise_ratio as psnr
from skimage.metrics import structural_similarity as ssim
from skimage.metrics import mean_squared_error
from skimage.color import deltaE_ciede2000

def mse(imageA, imageB):
    err = np.sum((imageA - imageB) ** 2)
    err /= float(imageA.shape[0] * imageA.shape[1]*imageA.shape[2])
    return err


def calculate_psnr(image1, image2):
    mse1 = mse(image1, image2)
    # 最大值通常为255（8位无符号整数的最大值）
    max_value = 255.0
    # 计算并返回PSNR
    psnr = 20 *np.log10(max_value / np.sqrt(mse1))
    return psnr

def evaluate(imgA,imgB):
    return mse(imgA,imgB),calculate_psnr(imgA,imgB),ssim(imgA,imgB,channel_axis=2),deltaE_ciede2000(imgA,imgB).mean()

