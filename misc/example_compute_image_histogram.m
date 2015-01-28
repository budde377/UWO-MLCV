function [H] = example_compute_image_histogram ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');

	I = imread('images/2b8e601a-4f94-4e43-8013-3f28c5784224.png', 'png');

	H = compute_image_histograms(I);
