function flag = isLocalMax(patch)
    patchCenter = (size(patch,1)+1)/2;
     [rows,cols] = find(patch == max(patch(:)));
     if(size(rows,1)>1)
         flag = 0;
     elseif(isequal([rows,cols],[patchCenter,patchCenter]))
         flag = 1;
     else
         flag = 0;
     end
end