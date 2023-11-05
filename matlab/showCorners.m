function showCorners(I,Ixx,Iyy,Ixy,Gxx,Gyy,Gxy,R,RNonMax,corners)
    % Normalize all matrices
    Ixx = Ixx/max(Ixx(:));
    Iyy = Iyy/max(Iyy(:));
    Ixy = Ixy/max(Ixy(:));
    Gxx = Gxx/max(Gxx(:));
    Gyy = Gyy/max(Gyy(:));
    Gxy = Gxy/max(Gxy(:));
    
    RNonMax = RNonMax/max(RNonMax(:));
    R = R/max(R(:));
    
    subplot(3,3,1);
        imshow(I),hold on;
        title('I');
        plot(corners(:,2),corners(:,1),'r.');
    subplot(3,3,2);
        imshow(Ixx);
        title('Ixx');
    subplot(3,3,3);
        imshow(Iyy);
        title('Iyy');
    subplot(3,3,4);
        imshow(Ixy);
        title('Ixy');
    subplot(3,3,5);
        imshow(Gxx);
        title('Gxx');
    subplot(3,3,6);
        imshow(Gyy);
        title('Gyy');
    subplot(3,3,7);
        imshow(Gxy);
        title('Gxy');
    subplot(3,3,8);
        imshow(R);
        title('R');
    subplot(3,3,9);
        imshow(RNonMax);
        title('RNonMax');
end