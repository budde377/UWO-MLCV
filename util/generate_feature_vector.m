function [ D ] = generate_feature_vector( I, Icanny, GDir)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
	H = compute_image_histograms(Icanny, GDir);
   
	s = 8/2;
	% Differences
	D = zeros([1,s+1]);
	for i = 1:s
		D(i) = emd_on_angle_histograms(H{i},H{i+s});
	end	
	D(s+1) = meanof(Icanny);
    
end

