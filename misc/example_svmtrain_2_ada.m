function [ ] = example_svmtrain_2_ada ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');
	addpath('emd');
	addpath('util');

	[G, F] = generate_data_matrixes('data_sets/data_sets/train/n/', 'data_sets/data_sets/train/nn/', '*.png');


	[class, model] = adaboost('train',F, G, 50);

    display(class);
    display(model);
	
