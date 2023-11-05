% Define kernel dimention
kernelSize = 6;
% Define sigma of the gaussian filter
sigma = 2;

% Creating a mean filter
oneDim = (1/kernelSize) * ones(kernelSize,1);
meanKernel = oneDim * oneDim';

% Creating a gaussian filter
gaussKernel = fspecial('gaussian', kernelSize, sigma);

% Reading the image
img = imread('CV_Lab_01_Images/leena_noisy.jpg');

% Converting to gray scale
grayImg = double(rgb2gray(img));

% Finding the outputs
gaussImg = convolution(grayImg,gaussKernel)/255;
meanImg = convolution(grayImg,meanKernel)/255;

figure('Name','Gaussian filtered image')
imshow(gaussImg);
figure('Name','Mean filtered image')
imshow(meanImg);