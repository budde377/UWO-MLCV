function [ N ] = find_nodes_in_image_diff_size(scale, I, box_size, step, classify)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    [h,w] = size(I);
    j = 1;
    N = [];
    down_h = h*scale;
    s = (h-down_h)/h;
    while h >=box_size && w>=box_size && s > 0
        display(size(I));
        Nm = find_nodes_in_image(I,box_size, step, classify)*j;
        N = [N; Nm];
        j = j/s;
        I = imresize(I, s);
        [h,w] = size(I);
        s = (h-down_h)/h;
    end
    
end

