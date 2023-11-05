import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread('images/image1.jpg')
#converting image into gray scale
print("Converting image into grayscale")
imgGray = np.array(cv2.cvtColor(img, cv2.COLOR_BGR2GRAY))

#Define gradients
gx = [[-1,-2,-1],[0,0,0],[1,2,1]]
gy = [[-1,0,1],[-2,0,2],[-1,0,1]]
kernelSize = np.shape(gx)[0]
#zero padding image for output of same size
imgIn = np.pad(imgGray,((kernelSize-1,kernelSize-1),(kernelSize-1,kernelSize-1)))

def correlate(image,kernel):
	#Find image dim
	imageHeight = np.shape(image)[0]
	imageWidth  = np.shape(image)[1]
	print("Image size is ",np.shape(image))
	#Find kernel dim
	kernelSize = np.shape(kernel)[0]
	print("Kernel size is kernelSize",np.shape(kernel))
	#find loop limits
	outHeight = imageHeight-kernelSize+1
	outWidth = imageWidth-kernelSize+1
	
	out = np.zeros((outHeight,outWidth))
	for i in range(outHeight):
		for j in range(outWidth):
			out[i:i+kernelSize,j:j+kernelSize] = np.sum(np.multiply(image[i:i+kernelSize,j:j+kernelSize],kernel))
	return out

print("Finding gradient along x-axis")
gradientX = correlate(imgIn,gx)

print("Finding gradient along y-axis")
gradientY = correlate(imgIn,gy)

imOut = np.power(np.power(gradientX,2)+np.power(gradientY,2),0.5)

#rescale values to [0,1]
imOut = imOut/255.
print("Output image size is ",np.shape(imOut))
cv2.imshow('Sobel operated image',imOut)
cv2.waitKey()
print("Finished processing")
