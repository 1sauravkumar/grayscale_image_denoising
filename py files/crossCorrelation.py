import numpy as np

def correlation(image,kernel):
	imgH, imgW = np.shape(image)
	kernelH, kernelW = np.shape(kernel)
	
	output = np.zeros((imgH-kernelH+1,imgW-kernelW+1))
	
	for i in range(imgH-kernelH+1):
		for j in range(imgW-kernelW+1):
			output[i,j] = np.sum(np.multiply(image[i:i+kernelH,j:j+kernelW],kernel))
	
	return output
