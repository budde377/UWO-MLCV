function [ D ] = generate_feature_vector( I, Icanny, GDir)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
	H = compute_image_histograms(Icanny, GDir);
   
	s = 8/2;
	% Differences
	D = zeros([1,s+5]);
	for i = 1:s
		D(i) = emd_on_angle_histograms(H{i},H{i+s});
	end	
	D(s+1) = mean(Icanny(:));
	D(s+2) = mean(mean(Icanny(1:15,1:15)));
	D(s+3) = mean(mean(Icanny(1:15,16:30)));
	D(s+4) = mean(mean(Icanny(16:30, 1:15)));
	D(s+5) = mean(mean(Icanny(16:30,16:30)));
end

