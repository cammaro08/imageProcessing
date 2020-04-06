function [greyScaleImage,RMS] = getOptimizedGreyImage(img,weightRank)


   
    imgWeights = bestWeightsWithRms(img);
    greyScaleImage = getGreyScaleImg(img, imgWeights(weightRank,2:end));
    RMS = imgWeights(weightRank,1);

    

end
%= ans(1,2:end)