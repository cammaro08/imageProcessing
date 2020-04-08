close all;
clear all;

imgOne = 'a20.tif';
imgTwo = 'a62.tif';
imgThree = 'a8.tif';


[imgOne1, imgOneRMS1] = getOptimizedGreyImage(imgOne,1);
[imgOne2, imgOneRMS2] = getOptimizedGreyImage(imgOne,2);
[imgOne3, imgOneRMS3] = getOptimizedGreyImage(imgOne,3);



%figure, imshow(imgOne1); title(['ImageOne with RMS value: ', num2str(imgOneRMS1)]);

imgOne1Normalized = normalizeImg(imgOne1);
imgOne1NormalizedRMS = rmsContrast(imgOne1Normalized);


%figure, imshow(imgOne1Normalized); title(['ImageOneNormalized with RMS value: ', num2str(imgOne1NormalizedRMS)]);

se = strel('disk',5);
imgOne1NormalizedProcessed = imclose(imgOne1Normalized,se);


%figure, imshow(imgOne1NormalizedProcessed); title(['ImageOneNomarlized and PreProccssed with RMS value: ', num2str(imgOne1NormalizedRMS)]);



figure;
subplot(2,2,1),imshow(imgOne); title('ImageOne Original ');
subplot(2,2,2),imshow(imgOne1); title(['ImageOne with RMS value: ', num2str(imgOneRMS1)]);
subplot(2,2,3),imshow(imgOne1Normalized); title(['ImageOneNormalized with RMS value: ', num2str(imgOne1NormalizedRMS)]);
subplot(2,2,4),imshow(imgOne1NormalizedProcessed); title(['ImageOneNomarlized and PreProccssed with RMS value: ', num2str(imgOne1NormalizedRMS)]);


%Edge Detection
BW1 = edge(imgOne1NormalizedProcessed,'sobel');
BW2 = edge(imgOne1NormalizedProcessed,'canny');
BW3 = edge(imgOne1NormalizedProcessed,'Prewitt');
BW4 = edge(imgOne1NormalizedProcessed,'Roberts');




figure;
imshowpair(BW1,BW2,'montage')
title('Sobel Filter                                   Canny Filter');


figure;
imshowpair(BW3,BW4,'montage')
title('Prewitt Filter                                   Roberts Filter');


