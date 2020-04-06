function [bestWeightsWithRms] = bestWeightsWithRms(imgToConvert)
    vals = generateCoefficients();
    
    bestWeightsWithRms = [];

    rgbImage = imread(imgToConvert);

    redChannel = rgbImage(:,:,1); % Red channel
    greenChannel = rgbImage(:,:,2); % Green channel
    blueChannel = rgbImage(:,:,3); % Blue channel

    
    for i = (1:(size(vals,1)))
        greyScaleImg = vals(i,1) * redChannel + vals (i,2) * greenChannel + vals (i,3) * blueChannel;
        rmsValue = rmsContrast(greyScaleImg);
        
        bestWeightsWithRms =[bestWeightsWithRms; [rmsValue, vals(i,1), vals(i,2), vals(i,3)]];
        
    end

    
    %sorting it out
    bestWeightsWithRms = sortrows(bestWeightsWithRms);
    bestWeightsWithRms = bestWeightsWithRms(183:185,:);
end


