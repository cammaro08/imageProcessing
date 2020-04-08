close all;
clear all;


imgThreeOrig = 'a8.tif';



[imgThree, imgThreeRMS] = getOptimizedGreyImage(imgThreeOrig,3);




%figure, imshow(imgOne1); title(['ImageOne with RMS value: ', num2str(imgOneRMS1)]);

imgThreeNormalized = normalizeImg(imgThree);
imgThreeNormalizedRMS = rmsContrast(imgThreeNormalized);


%figure, imshow(imgOne1Normalized); title(['ImageOneNormalized with RMS value: ', num2str(imgOne1NormalizedRMS)]);

se = strel('disk',5);
imgThreeNormalizedProcessed1 = imclose(imgThreeNormalized,se);
imgThreeNormalizedProcessed2 = imclose(imgThreeNormalizedProcessed1,se);


%figure, imshow(imgOne1NormalizedProcessed); title(['ImageOneNomarlized and PreProccssed with RMS value: ', num2str(imgOne1NormalizedRMS)]);



figure;
subplot(2,2,1),imshow(imgThreeOrig); title('imgThree Original ');
subplot(2,2,2),imshow(imgThree); title(['imgThree with RMS value: ', num2str(imgThreeRMS)]);
subplot(2,2,3),imshow(imgThreeNormalized); title(['imgThreeNormalized with RMS value: ', num2str(imgThreeNormalizedRMS)]);
subplot(2,2,4),imshow(imgThreeNormalizedProcessed2); title(['imgThree PreProccssed', num2str(imgThreeNormalizedRMS)]);



%Edge Detection
BW1 = edge(imgThreeNormalizedProcessed1,'sobel');
BW2 = edge(imgThreeNormalizedProcessed1,'canny');
BW3 = edge(imgThreeNormalizedProcessed1,'Prewitt');
BW4 = edge(imgThreeNormalizedProcessed1,'Roberts');




figure;
imshowpair(BW1,BW2,'montage')
title('Sobel Filter                                   Canny Filter');


% figure;
% imshowpair(BW3,BW4,'montage')
% title('Prewitt Filter                                   Roberts Filter');




