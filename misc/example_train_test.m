function [d] = example_train_test ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');
	addpath('emd');
	addpath('util');

	G1 = dlmread('data_matrix_class_train');
	F1 = dlmread('data_matrix_features_train');

	svm_struct = crossvalidate(F1, G1);

	G2 = dlmread('data_matrix_class_test');
	F2 = dlmread('data_matrix_features_test');

	Group = svmclassify(svm_struct, F2);
	
	csvwrite('data_matrix_class_classified', Group);


	d = 0;
	[h,~] = size(Group);
	for l = 1:h					
		if ~(Group(l,1) == G2(l,1))
			d = d+1;
		end
	end
