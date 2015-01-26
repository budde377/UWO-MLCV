function [ N ] = find_nodes_in_scaled_image( I, box_size, step, svm_struct )

	[h, w] = size(I);
		
	num_step_box = ceil(box_size / step);
	
	num_h_steps = floor(h / step) - num_step_box;
	num_w_steps = floor(w / step) - num_step_box;
	
	Icanny = edge(I, 'canny', 0.4);
	[~, Gdir] = imgradient(Icanny);
 
	N = [];
	
	% Traverse image
	for i = 0:num_h_steps

		offset_i = i * step;

		for j = 0:num_w_steps

			offset_j = j * step;

			% Move a step
			I3 = I(offset_i + 1:offset_i + box_size, offset_j + 1:offset_j + box_size);
			I3canny = Icanny(offset_i + 1:offset_i + box_size, offset_j + 1:offset_j + box_size);

			if sum(I3canny(:)) > 0

				I3GDir = Gdir(offset_i + 1:offset_i + box_size, offset_j + 1:offset_j + box_size);

				% Generate feature vector and classify
				v = generate_feature_vector(I3, I3canny, I3GDir);
				x = svmclassify(svm_struct,v);
				c = x == 1;
				vc = [v, c];

				% If classied as node, save in nodes
				if c
					N = [N; offset_i, offset_j, box_size];
				end

			end

		end
	end	
end

