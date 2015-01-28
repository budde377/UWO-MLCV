function [] = example_save_test_data_matrix ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');
	addpath('emd');
	addpath('util');

	[G, F] = generate_data_matrixes('data_sets/data_sets/test/n/', 'data_sets/data_sets/test/nn/', '*.png');

	dlmwrite('data_matrix_class_test', G);
	dlmwrite('data_matrix_features_test', F);
