import cv2
import numpy as np

from normalization import normalize
from crossCorrelation import correlation

# Read the images
targetImg = cv2.imread('images/where-is-waldo.jpg')
print("Target image shape is",np.shape(targetImg))
tempImg = cv2.imread('images/waldo.jpg')
print("Template image shape is",np.shape(tempImg))
tempH,tempW,ch = tempImg.shape

# Converting to gray scale
print("Converting to gray scale")
grayTarget = cv2.cvtColor(targetImg,cv2.COLOR_BGR2GRAY)
grayTemplate = cv2.cvtColor(tempImg,cv2.COLOR_BGR2GRAY)

# Perform normalization
print("Perform normalization")
normGrayTarget = normalize(grayTarget)
normGrayTemplate = normalize(grayTemplate)

print("Perform cross-correlation")
score = correlation(normGrayTarget,normGrayTemplate)

print(np.max(score))

y,x = np.unravel_index(np.argmax(score),score.shape)
print(x,y)
finalImg = cv2.rectangle(targetImg,(x,y),(x+tempW,y+tempH),(255,0,0),3)

cv2.imshow('Final image',finalImg)
cv2.waitKey(0)
