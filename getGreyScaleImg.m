function greyScaleImg = getGreyScaleImg(img,vals)

    img = imread(img);


    redChannel = img(:,:,1); % Red channel
    greenChannel = img(:,:,2); % Green channel
    blueChannel = img(:,:,3); % Blue channel


    greyScaleImg = vals(1) * redChannel + vals (2) * greenChannel + vals (3) * blueChannel;

end