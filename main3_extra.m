clear all;
close all;
clc;
% use a thresholded image as input (binary image)
I1 = 'a8.tif';       % read image
subplot(2,3,1),imshow(I1),title('Original Image');
% object in the image is represented by white colour
% background is represented by black colour

I2 = getOptimizedGreyImage(I1,3);

I = 255 - I2;                % Invert the image
subplot(2,3,2),imshow(I),title('Inverted Image');
SE = strel('disk',6);     % generate the structuring element
E = imerode(I,SE);          % Perform Erosion Operation
subplot(2,3,3),imshow(E),title('Eroded Image');
D = imdilate(I,SE);          % Perform Dilation Operation
subplot(2,3,4),imshow(D),title('Dilated Image');
O = imopen(I,SE);          % Perform Opening Operation
subplot(2,3,5),imshow(O),title('Opened Image');
C = imclose(I,SE);          % Perform Closing Operation
subplot(2,3,6),imshow(C),title('Closed Image');


lolz = imopen(O,SE);
lolz2 = imopen(O,SE);
figure, imshow(255 - lolz2),title('opened x3 further');


BW2 = edge(lolz2,'canny');


% figure,imshow(BW2),title('edge detection');


SE1 = strel('disk',1);
erodedBW2 = imdilate(BW2,SE1);

figure,imshow(erodedBW2),title('Dilated edge detection');

%labelling


labeledImage = bwlabel(erodedBW2, 8);
coloredLabels = label2rgb (labeledImage, 'hsv', 'k', 'noshuffle');
figure,imshow(coloredLabels),title('Labeled Image, from bwlabel()');










