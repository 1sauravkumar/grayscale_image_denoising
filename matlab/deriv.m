function [Ex,Ey,Et] = deriv(img1,img2)

% rescale image to adjust for brightness changes
img1 = im2double(img1);
img1 = img1/max(img1(:));

img2 = im2double(img2);
img2 = img2/max(img2(:));
% define kernels
kerHor = 0.25*[1,-1;1,-1];
kerVer = 0.25*[-1,-1;1,1];
kert = 0.25*[-1,-1;-1,-1];
% find gradients
Ex = conv2(img1,kerHor,'same') + conv2(img2,kerHor,'same');
Ey = conv2(img2,kerVer,'same') + conv2(img2,kerVer,'same');
Et = conv2(img2,-kert,'same') + conv2(img1,kert,'same');
end