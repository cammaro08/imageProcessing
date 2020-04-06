close all;
clear all;

imgOne = 'a20.tif';
imgTwo = 'a62.tif';
imgThree = 'a8.tif';


[imgOne1, imgOneRMS1] = getOptimizedGreyImage(imgOne,1);
[imgOne2, imgOneRMS2] = getOptimizedGreyImage(imgOne,2);
[imgOne3, imgOneRMS3] = getOptimizedGreyImage(imgOne,3);


imshow(imgOne1); title(['ImageOne with RMS value: ', num2str(imgOneRMS1)]);
imshow(imgOne2); title(['ImageOne with RMS value: ', num2str(imgOneRMS2)]);
imshow(imgOne3); title(['ImageOne with RMS value: ', num2str(imgOneRMS3)]);
