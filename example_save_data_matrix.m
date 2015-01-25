function [] = example_save_data_matrix ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');
	addpath('emd');
	addpath('util');

	[G, F] = generate_data_matrixes('data_sets/data_sets/train/n/', 'data_sets/data_sets/train/nn/', '*.png');

	dlmwrite('data_matrix_class_train', G);
	dlmwrite('data_matrix_features_train', F);
