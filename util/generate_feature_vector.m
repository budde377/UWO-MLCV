function [ D ] = generate_feature_vector( I, Icanny, GDir)
%generate_feature_vector It generates a feature vector 

	H = compute_image_histograms(Icanny, GDir);
   
	s = 8/2;
	% Differences
	D = zeros([1,s+5]);
	for i = 1:s
		% Calculating the emd distances between the regions
		D(i) = emd_on_angle_histograms(H{i},H{i+s});
	end	
	[img_h, img_w] = size(I);
	img_h2 = floor(img_h/2);
	img_w2 = floor(img_w/2);

	% Calculating the mean of the whole edge-image
	D(s+1) = mean(Icanny(:));
	% Calculating the mean of the top-left quater of the edge-image
	D(s+2) = mean(mean(Icanny(1:img_h2,1:img_w2)));
	% Calculating the mean of the top-right quater of the edge-image
	D(s+3) = mean(mean(Icanny(1:img_h2,(img_w2+1):img_w)));
	% Calculating the mean of the bottom-left quater of the edge-image
	D(s+4) = mean(mean(Icanny((img_h2+1):img_h, 1:img_w2)));
	% Calculating the mean of the bottom-right quater of the edge-image
	D(s+5) = mean(mean(Icanny((img_h2+1):img_h,(img_w2+1):img_w)));
end

