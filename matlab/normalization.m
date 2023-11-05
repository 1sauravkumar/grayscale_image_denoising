function kernelNormalized = normalization(kernel)

kernelAvg = mean(mean(kernel));
kernelNormalized = (kernel - kernelAvg) / (sum(sum(((kernel - kernelAvg) .^2))) ^ 0.5);

end
