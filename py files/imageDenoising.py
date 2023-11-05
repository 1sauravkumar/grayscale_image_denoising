import cv2
import numpy as np

# Specify input parameters
kSize = int(input("Enter the kernel size"))
sigma = int(input("Enter the sigma value"))

# Read the image
img = cv2.imread('images/leena_noisy.jpg')
# Convert image to gray scale
grayImg = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)

# cv2.GaussianBlur() blurs the image using a gaussian kernel with size and sigma as arguments
outImg = cv2.GaussianBlur(grayImg,(kSize,kSize),sigma)
cv2.imshow('Filtered Image',outImg)
cv2.waitKey(0)
