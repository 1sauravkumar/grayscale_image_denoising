function [U,V] = findUV(Ex,Ey,Et,alpha)
% initialize matrix
U = zeros(size(Ex));
V = zeros(size(Ex));
% define kernel to find average of the matrix using laplacian approximation
avgKer = [1/12,1/6,1/12;1/6,-1,1/6;1/12,1/6,1/12];

iter = 1;
% define number of iterations
numIter = 200;
B = alpha^2 + (Ex.^2) + (Ey.^2);
while(iter<numIter)
    % find average for both u and v
    avgU = conv2(U,avgKer,'same');
    avgV = conv2(V,avgKer,'same');
    A = (Ex.*avgU)+(Ey.*avgV)+Et;
    U = avgU - Ex.*(A./B);
    V = avgV - Ey.*(A./B);
    iter = iter+1;
end
end
