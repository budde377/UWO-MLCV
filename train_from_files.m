function [ s ] = train_from_files( group_file_name, feature_file_name)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
	G = dlmread(group_file_name);
	
	F = dlmread(feature_file_name);
	
	s = svmtrain(F, G);
end

