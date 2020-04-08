function normalizedImage = normalizeImg(img)

    Imax=max(max(img));
    Imin=min(min(img));


    normalizedImage=((img-Imin)* ((255-0)/(Imax-Imin))) +0;
end