function peaks = houghPeaks(H,numPeaks)
% Copy H into HCopy
    HCopy = H;
    %Initiate peaks matrix
    peaks = zeros(numPeaks,2);
    numP = 0;
    threshold = 0.6*max(H(:));
   while(numP<numPeaks)
       if(threshold<=max(HCopy(:)))
           numP = numP + 1;
           [rows,cols] = find(HCopy == max(HCopy(:)));
           % make a copy of the positions and make it 0
           peaks(numP,:) = [rows(1),cols(1)];
           HCopy(rows(1),cols(1)) = 0;
       else
           % break if threshold condition is not met
           break;
       end
   end
   % return updated peaks matrix
   peaks = peaks(1:numP,:);
end