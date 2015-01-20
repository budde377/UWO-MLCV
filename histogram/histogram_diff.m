function [D] = histogram_diff ( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');
	addpath('emd');
	addpath('util');

	H = compute_image_histograms(I);

	% Differences
	D = [];
	b = 8/2;
	for i = 1:b
		D(i) = emd_on_angle_histograms(H{i},H{i+b});
	end
