function [H] = compute_image_histograms ( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%	addpath('../util');
	
	I = rgb2gray(I);
	
	% imshow(I);
	
	I = edge(I,'canny',0.4);
	
	H = compute_image_histogram_from_gradient(I);
    
    

end
