function [D] = example_histogram_diff ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');
	addpath('emd');
	addpath('util');

	I1 = imread('images/IMG_20141128_143836b.jpg', 'jpeg');
	H1 = compute_image_histograms(I1);

	I2 = imread('images/IMG_20141128_143836d.jpg','jpeg');
	H2 = compute_image_histograms(I2);

	% Differences
	D = [];
	for i = 1:8
		H1(i)
		H2(i)
		D(i) = emd_on_angle_histograms(H1(i),H2(i));
	end
