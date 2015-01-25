function [ N ] = find_nodes_in_image_diff_size(scale, I, box_size, step, classify, lower_scale)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    [org_h,w] = size(I);
    h = org_h;
    j = 1;
    N = [];
    down_h = h*scale;
    s = (h-down_h)/h;
    stop_h = org_h*lower_scale;
    while h >=box_size && w>=box_size && h >= stop_h && s > 0 
        display(size(I));
        Nm = find_nodes_in_image(I,box_size, step, classify)*j;
        N = [N; Nm];
        j = j/s;
        if s > 0
            I = imresize(I, s);
            [h,w] = size(I);
            s = (h-down_h)/h;
        end 
    end
    
end

