img = imread('images/chessBoard.jpg');
grayImg = rgb2gray(img);

% Create a struct for parameters
hyperParam.sigma1 = 10;
hyperParam.sigma2 = 2;
hyperParam.threshold = 0.2;
hyperParam.alpha = 0.04;

% Harris corner detector
[I,Ixx,Iyy,Ixy,Gxx,Gyy,Gxy,R,RNonMax,corners] = harrisCorner(grayImg,hyperParam);
showCorners(I,Ixx,Iyy,Ixy,Gxx,Gyy,Gxy,R,RNonMax,corners);

figure();
imshow(img);
title('Chessboard with corners');
hold on;
plot(corners(:,2),corners(:,1),'r.')