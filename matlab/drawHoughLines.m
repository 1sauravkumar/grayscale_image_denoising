function drawHoughLines(img,peaks,rho,theBin)
% below code is self explanatory
figure()
imshow(img);
hold on;
length(rho)
for i = 1:size(peaks,1)
    rhoTemp = rho(peaks(i,1));
    theTemp = theBin(peaks(i,2));
    if theTemp == 0
        x1 = rhoTemp;
        x2 = rhoTemp;
        y1 = 1;
        y2 = size(img,1);
    else
        x1 = 1;
        x2 = size(img,2);
        y1 = (rhoTemp - x1*cos(theTemp*pi/180)) / sin(theTemp*pi/180);
        y2 = (rhoTemp - x2*cos(theTemp*pi/180)) / sin(theTemp*pi/180);
    end
    plot([x1,x2],[y1,y2],'r','LineWidth',2);
    title('Image with hough lines');
end

end