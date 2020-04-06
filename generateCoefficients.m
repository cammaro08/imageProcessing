
function coefficients = generateCoefficients()
    %generating coefficients
    redChannel = 0;
    blueChannel = 0;
    greenChannel = 0;

    MAX_VALUE = 1;
    iterations = 10;
    coefficients =[];


    for i = (0:iterations)
        if (redChannel + greenChannel + blueChannel < MAX_VALUE)
            coefficients = [coefficients; [redChannel, greenChannel, blueChannel]];
        end
        %1st loop
        for j = (0:iterations)
            greenChannel = greenChannel + 0.1;
                if (redChannel + greenChannel + blueChannel < MAX_VALUE)
                    coefficients = [coefficients; [redChannel, greenChannel, blueChannel]];
                end

                %inner loop
                for s = (0:iterations)
                    blueChannel = blueChannel + 0.1;
                    if (redChannel + greenChannel + blueChannel < MAX_VALUE)
                        coefficients = [coefficients; [redChannel, greenChannel, blueChannel]];
                    end
                end
                blueChannel = 0;
        end

        %2nd loop

        for m = (0:iterations)
            blueChannel = blueChannel + 0.1;
            if (redChannel + greenChannel + blueChannel < MAX_VALUE)
                coefficients = [coefficients; [redChannel, greenChannel, blueChannel]];
            end        
        end

        redChannel = redChannel + 0.1;
        greenChannel = 0;
        blueChannel = 0;

    end
end





% histogram calculations
% choose nmax and nmin 255 or 0
% calculate max and min value of current value
%     max of max of i