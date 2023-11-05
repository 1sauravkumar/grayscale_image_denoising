% Reading the image and target
img = imread('CV_Lab_01_Images/where-is-waldo.jpg');
target = imread('CV_Lab_01_Images/waldo.jpg');

% Converting to gray scale
grayImg = double(rgb2gray(img));
grayTarget = double(rgb2gray(target));

% Finding the correlation score
score = normalizedCorrelation(grayImg,grayTarget);

% Finding the maximum value of the correlation
maximum = max(max(score));

% Finding the coordinates of the maximum value in the score map
[x,y] = find(score == maximum);

% Plotting correlation score
figure('Name','Correlation score')
imshow(score);

% Plotting the image with the identified target
figure('Name','Image with ROI')
imshow(img);
hold on;
rectangle('Position',[y x 66 90],'LineWidth',3,'Edgecolor','g');