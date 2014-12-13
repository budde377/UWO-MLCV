function [sum] = image_sum(M)
    [width,height] = size(M);
    sum = 0;
    for i = 1:width*height
        sum = sum + M(i);
    end
    