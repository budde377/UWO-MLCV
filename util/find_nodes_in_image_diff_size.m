function [ N ] = find_nodes_in_image_diff_size(scale, I, box_size, step, classify)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    [h,w] = size(I);
    j = 1;
    N = [];
    
    while and(h >=box_size, w>=box_size)
        display(size(I))
        Nm = find_nodes_in_image(I,box_size, step, classify)*j;
        N = [N; Nm];
        j = j/scale;
        I = imresize(I, scale);
        [h,w] = size(I);
    end
    
end

