close all;
clear all;


imgTwoOrig = 'a62.tif';



[imgTwo, imgTwoRMS] = getOptimizedGreyImage(imgTwoOrig,3);




%figure, imshow(imgOne1); title(['ImageOne with RMS value: ', num2str(imgOneRMS1)]);

imgTwoNormalized = normalizeImg(imgTwo);
imgTwoNormalizedRMS = rmsContrast(imgTwoNormalized);


%figure, imshow(imgOne1Normalized); title(['ImageOneNormalized with RMS value: ', num2str(imgOne1NormalizedRMS)]);

se = strel('disk',5);
imgTwoNormalizedProcessed = imclose(imgTwoNormalized,se);


%figure, imshow(imgOne1NormalizedProcessed); title(['ImageOneNomarlized and PreProccssed with RMS value: ', num2str(imgOne1NormalizedRMS)]);



figure;
subplot(2,2,1),imshow(imgTwoOrig); title('imgTwo Original ');
subplot(2,2,2),imshow(imgTwo); title(['imgTwo with RMS value: ', num2str(imgTwoRMS)]);
subplot(2,2,3),imshow(imgTwoNormalized); title(['imgTwoNormalized with RMS value: ', num2str(imgTwoNormalizedRMS)]);
subplot(2,2,4),imshow(imgTwoNormalizedProcessed); title(['imgTwo PreProccssed', num2str(imgTwoNormalizedRMS)]);




%Edge Detection
BW1 = edge(imgTwoNormalizedProcessed,'sobel');
BW2 = edge(imgTwoNormalizedProcessed,'canny');
BW3 = edge(imgTwoNormalizedProcessed,'Prewitt');
BW4 = edge(imgTwoNormalizedProcessed,'Roberts');




figure;
imshowpair(BW1,BW2,'montage')
title('Sobel Filter                                   Canny Filter');


figure;
imshowpair(BW3,BW4,'montage')
title('Prewitt Filter                                   Roberts Filter');







