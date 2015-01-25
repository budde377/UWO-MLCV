function [ N1 ] = find_nodes_in_image(scale, I, box_size, step, svm_struct, min_scale )

	[h_orig, w] = size(I);
	h = h_orig;

	h_down = h * scale;
	s = (h - h_down) / h;
	h_stop = h_orig * min_scale;

	j = 1;
	N1 = [];

	% Loop until 'box_size' or 'h_stop' exceeds image size or scale 's' is <= 0
	while h >= box_size && w >= box_size && h >= h_stop && s > 0

%		display(size(I));

		N2 = find_nodes_in_scaled_image(I, box_size, step, svm_struct) * j;
		N1 = [N1; N2];
		j = j / s;

		% Downscale image if possible
		if s > 0
			I = imresize(I, s);
			[h, w] = size(I);
			s = (h - h_down) / h;
		end 

	end
	
end

