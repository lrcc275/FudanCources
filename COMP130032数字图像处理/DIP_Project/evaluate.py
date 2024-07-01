import cv2
import numpy as np
import glob
from Baseline_DCP import dehaze_baseline
from ImageEnhancement_ACE import dehaze_ACE
from ImageRestoration_NonLocal import dehaze_nonlocal
from eval import evaluate
import time

haze_folder_path = "HazeRD-haze/*_100.jpg"  # 有雾图片文件夹路径
gt_folder_path = "HazeRD-dehaze/*.JPG"# GT 图片文件夹路径
#dehaze_folder_path = "O-HAZY-output/"  # 去雾后的图片保存路径


mse,psnr,ssim,ciede2000 = 0,0,0,0
num_pairs = 0

haze_image_paths = glob.glob(haze_folder_path)
gt_image_paths = glob.glob(gt_folder_path)

# 遍历每个有雾图片和对应的 GT 图片，并处理
start = time.time()
for haze_path, gt_path in zip(haze_image_paths, gt_image_paths):
    print("picture ",haze_path," begin being processed")
    # 读取有雾图片和 GT 图片
    haze_img = cv2.imread(haze_path)
    gt_img = cv2.imread(gt_path)
    haze_img = cv2.resize(haze_img,(400,600))
    gt_img = cv2.resize(gt_img,(400,600))
    after_dehaze = dehaze_ACE(haze_img)
    _mse,_psnr,_ssim,_ciede2000 = evaluate(after_dehaze, gt_img)
    mse = mse + _mse
    psnr = psnr + _psnr
    ssim = ssim + _ssim
    ciede2000 = ciede2000 + _ciede2000

    num_pairs += 1

end = time.time()
print("after running time : ",end - start," s,the result is: ")
mse = mse / num_pairs
psnr = psnr / num_pairs
ssim = ssim / num_pairs
ciede2000 = ciede2000 / num_pairs
print("mse = ",mse)
print("psnr = ",psnr)
print("ssim = ",ssim)
print("ciedie2000 = ",ciede2000)