import cv2
from Baseline_DCP import dehaze_baseline
from ImageEnhancement_ACE import dehaze_ACE
from ImageRestoration_NonLocal import dehaze_nonlocal
from eval import evaluate


#test for a single image

img = cv2.imread("Self-selected-pictures/RESIDE-example.jpg")   #fill the address for hazy images
img = cv2.resize(img,(400,600))
dehaze_img = dehaze_ACE(img)    #change the way you use to dehaze here
image = cv2.hconcat([img, dehaze_img])
cv2.imshow('Image Before and After dehaze', image)
cv2.imwrite("Self-selected-pictures/after_RESIDE_ACE.jpg", dehaze_img)
cv2.waitKey(0)
cv2.destroyAllWindows()



#针对有清晰如图的情况
# GT_img = cv2.imread("") #fill the address for GT images
# print("The result is: ")
# mse ,psnr ,ssim = evaluate(GT_img,dehaze_img)  #get result
# print("mse = ",mse)
# print("psnr = ",psnr)
# print("ssim = ",ssim)