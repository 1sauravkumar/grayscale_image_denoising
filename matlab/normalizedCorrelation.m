function output = normalizedCorrelation(image,kernel)

kernelNormalized = normalization(kernel);

imageSize = size(image);
kernelSize = size(kernel);

outputSize = imageSize-kernelSize+1;

output = zeros(outputSize);

for i = 1:outputSize(1)
    for j = 1:outputSize(2)
       normalizedImage = normalization(image(i : i+kernelSize(1)-1,j:j+kernelSize(2)-1));
       output(i,j) = sum(sum(normalizedImage .* kernelNormalized));
    end
end

end