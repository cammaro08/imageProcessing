function RMS = rmsContrast(greyScaleImg)
    greyScaleImgAvg = mean(greyScaleImg(:)); 

    Isquare = (greyScaleImg - greyScaleImgAvg).^2;
    Isum=sum(sum(Isquare));
    SqrtI = Isum.^0.5;

    [M,N]= size(greyScaleImg);

    RMS = SqrtI / ((M*N).^0.5);
end