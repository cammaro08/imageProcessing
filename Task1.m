%1st task
clear all
vals = generateCoefficients();


rgbImage = imread('a20.tif');

redChannel = rgbImage(:,:,1); % Red channel
greenChannel = rgbImage(:,:,2); % Green channel
blueChannel = rgbImage(:,:,3); % Blue channel




for i = (1:(size(vals,1)))
    
    greyScaleImg = vals(i,1) * redChannel + vals (i,2) * greenChannel + vals (i,3) * blueChannel;
    
end



imshow(greyScaleImg);




%RMS contrast
greyScaleImgAvg = mean(greyScaleImg(:)); 

Isquare = (greyScaleImg - greyScaleImgAvg).^2;
Isum=sum(sum(Isquare));
SqrtI = Isum.^0.5;

[M,N]= size(greyScaleImg);

RMS = SqrtI / ((M*N).^0.5);

