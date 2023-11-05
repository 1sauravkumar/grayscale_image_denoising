function [H,theBin,rho] = houghVotes(edgeImg)
%Define the theta bin
theBin = -90:89;
% Find the maximum possible d: diagnol length of the image
d = sqrt(size(edgeImg,1)^2 + size(edgeImg,2)^2);
% Define step size for rhoBin matrix
rStep = 1;
% Define rho range
rho = -d:rStep:d;
% Rescale rho
rhoBin = 0:rStep:ceil(2*d);
% Initiate hough matrix
H = zeros(length(rhoBin),length(theBin));

% Below code if self explanatory
for i = 1:size(edgeImg,1)
    for j = 1:size(edgeImg,2)
        if(edgeImg(i,j))
            for k = 1:length(theBin) 
                tempR = j*cos(theBin(k)* pi/180) + i*sin(theBin(k) * pi/180);
                tempR = round((tempR + d)/rStep)+1;
                H(tempR,k) = H(tempR,k) + 1;
            end
        end
    end
end

end