% read images
img1 = imread('images/hsimg1.png');
img2 = imread('images/hsimg2.png');
% define alpha
alpha = 0.05;
% find derivatives
[Ex,Ey,Et] = deriv(img1,img2);
% find u and v velocity vectors
[U,V] = findUV(Ex,Ey,Et,alpha);

% display the image with velocity vectors
[imgH,imgW] = size(img1);
[X,Y] = meshgrid(1:imgW,1:imgH);
imshow(img1);
hold on;
quiver(X,Y,U,V,3);