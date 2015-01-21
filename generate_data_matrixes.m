function [ G, F ] = generate_data_matrixes( positive_path, negative_path, file_type)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

	Is = load_images_from_folder(positive_path, file_type);
	Dpos = generate_feature_matrix(Is);
	s1 = numel(Dpos);
	
	Is = load_images_from_folder(negative_path, file_type);
	Dneg = generate_feature_matrix(Is);
	s2 = numel(Dneg);
	
	G = cell(s1+s2, 1);
	
	G(1:s1) = {'positive'};
	G(s1+1:s1+s2) = {'negative'};
	F = [Dpos;Dneg];
	
end

