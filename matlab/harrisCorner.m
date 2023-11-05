function [I,Ixx,Iyy,Ixy,Gxx,Gyy,Gxy,R,RNonMax,corners] = harrisCorner(img,param)
   % Normalizing image
   I = double(img);
   I = I / max(I(:));
   
   % Defining kernels
   kernelWidth = round(param.sigma1*3)*2+1;
   smoothKernel = fspecial('gaussian',[kernelWidth,kernelWidth],param.sigma2);
   kerHor = [1 1 1;0 0 0;-1 -1 -1];
   kerVer = [1 0 -1;0 0 0;1 0 -1];
   
   % First derivatives
   Ix = conv2(I,kerVer,'same');
   Iy = conv2(I,kerHor,'same');
   
   % Second degree derivatives
   Ixx = Ix.^2;
   Iyy = Iy.^2;
   Ixy = Ix.*Iy;
   
   % Applying smoothing filter 
   Gxx = conv2(Ixx,smoothKernel,'same');
   Gyy = conv2(Iyy,smoothKernel,'same');
   Gxy = conv2(Ixy,smoothKernel,'same');
   
   % Calculate R matrix
   R = ((Gxx.*Gyy) - (Gxy.^2)) - param.alpha * (Gxx+Gyy).^2;
   % Normalize R
   R = R/max(R(:));
   [imgH,imgW] = size(I);
   RNonMax = zeros(imgH,imgW);
   
   for i = 2:imgH-1
       for j = 2:imgW-1
           if(isLocalMax(R(i-1:i+1,j-1:j+1)) && R(i,j)>param.threshold)
               RNonMax(i,j) = 1;
           end
       end
   end
   
   [rows,cols] = find(RNonMax == 1);
   
   corners = [rows,cols]; 
end