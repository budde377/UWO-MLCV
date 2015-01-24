function [ N ] = find_nodes_in_image( I, box_size, step, classify)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    [h, w] = size(I);
        
    num_step_box = ceil(box_size/step);
    
    num_h_steps = floor(h/step)-num_step_box;
    num_w_steps = floor(w/step)-num_step_box;
    
    
    Icanny = edge(I,'canny',0.4);
    [~, Gdir] = imgradient(Icanny);
 
    N = [];
    for i = 0:num_h_steps
        for j = 0:num_w_steps
            offset_i = i*step;
            offset_j = j*step;
            I3 = I(offset_i+1:offset_i+box_size, offset_j+1:offset_j+box_size);
            I3canny = Icanny(offset_i+1:offset_i+box_size, offset_j+1:offset_j+box_size);
            if sum(I3canny(:)) > 0
                I3GDir = Gdir(offset_i+1:offset_i+box_size, offset_j+1:offset_j+box_size);

                v = generate_feature_vector(I3, I3canny, I3GDir);
                c = classify(v);
                vc = [v, c];
                if c
                    N = [N; offset_i,offset_j, box_size];
                end
            end
        end
    end    
end

