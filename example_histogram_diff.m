function [D] = example_histogram_diff ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');
	addpath('emd');
	addpath('util');

	I = imread('images/2.jpg', 'jpeg');

	D = generate_feature_vector(I);