function [svm_struct] = example_svmtrain_2 ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');
	addpath('emd');
	addpath('util');
	[G, F] = generate_data_matrixes('data_sets/data_sets/train/n/', 'data_sets/data_sets/train/nn/', '*.png');

	[name,value] = crossvalidate(F, G);

	svm_struct = svmtrain(F, G, name, value);

	
