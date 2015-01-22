function [ N ] = find_nodes_in_image( I, box_size, step, classify)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    [h, w] = size(I);
    
    num_box_step = ceil(box_size/step);
    
    num_h_steps = ceil(h/step)+num_box_step-1;
    num_w_steps = ceil(w/step)+num_box_step-1;
    
    I2 = zeros(h+2*box_size, w+2*box_size);
    I2(box_size+1:h+box_size,box_size+1:w+box_size) = I;
    Icanny = zeros(h+2*box_size, w+2*box_size);
    Icanny(box_size+1:h+box_size,box_size+1:w+box_size) = edge(I,'canny',0.4);
    [~, Gdir] = imgradient(Icanny);

    N = [];
    
    for i = 1:num_h_steps
        display(i/(num_h_steps))
        for j = 1:num_w_steps
            offset_i = (i)*step;
            offset_j = (j)*step;
            I3 = I2(offset_i+1:offset_i+box_size, offset_j+1:offset_j+box_size);
            I3canny = Icanny(offset_i+1:offset_i+box_size, offset_j+1:offset_j+box_size);
            v = generate_feature_vector(I3, I3canny, Gdir);
            c = classify(v);
            if c
                N = [N; offset_i+1-box_size,offset_j+1-box_size, box_size];
            end
        end
    end    
end

