import numpy as np

def normalize(image):
	mean = np.mean(image)
	
	meanSubtractedImage = image - mean
	
	return np.divide(meanSubtractedImage,np.power(np.sum(np.power(meanSubtractedImage,2)),0.5))
