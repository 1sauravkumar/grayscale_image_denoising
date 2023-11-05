function output = convolution(image,kernel)

% Filp the kernel
flippedKernel = flip(flip(kernel,1),2);

% Finding the dimentions of the image and the kernel
imageSize = size(image);
kernelSize = size(kernel);

% Finding the ouptut dimention
outputSize = imageSize-kernelSize+1;

output = zeros(outputSize);

for i = 1:outputSize(1)
    for j = 1:outputSize(2)
       output(i,j) = sum(sum(image(i : i+kernelSize(1)-1,j:j+kernelSize(2)-1) .* flippedKernel));
    end
end

end