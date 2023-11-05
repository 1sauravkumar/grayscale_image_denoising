% provide path for the image
img = imread('images/image2.png');
% Define hyper parameters
% tweak numPeaks for more lines(if required)
numPeaks = 14;
% Find the threshold for canny edge detection
[BW,threshOut] = edge(img,'Sobel');
% Find the edge image using canny edge detector
windowEdge = edge(img,'Canny',threshOut);
% Call the function houghVotes() to vote for Hough matrix
[H,theBin,rho] = houghVotes(windowEdge);
% Find the hough peaks using houghPeaks()
peaks = houghPeaks(H,numPeaks);
% Draw the lines on the image using drawHoughLines()
drawHoughLines(img,peaks,rho,theBin);