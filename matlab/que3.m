% Reading the image
img = double(imread('CV_Lab_01_Images/image1.jpg'));

% Define the threshold
thresh = 100;

% Define the sobel kernel
Gx = [1 0 -1 ; 2 0 -2 ; 1 0 -1];
Gy = [1 2 1 ; 0 0 0 ; -1 -2 -1];

% Applying the kernels
imgGx = convolution(img,Gx);
imgGy = convolution(img,Gy);

% Finding |Gx| + |Gy|
imgG = abs(imgGx) + abs(imgGy);

% Applying the threshold on the image
outImg = (imgG > thresh) + (0*(imgG <= thresh));

% Plot the output
imshow(outImg);