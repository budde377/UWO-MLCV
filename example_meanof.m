function [m] = example_meanof ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('util');

	I = imread('images/2.png', 'png');
	m = meanof(I);
