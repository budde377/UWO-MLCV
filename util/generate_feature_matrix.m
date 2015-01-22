function [ F ] = generate_feature_matrix( Is )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
	s = numel(Is);
	F = zeros(s,5);
	for i = 1:s
		F(i,:) = generate_feature_vector(Is{i}); 
	end 

end

