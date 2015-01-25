function [svm_struct] = example_svmtrain_3 ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('histogram');
	addpath('emd');
	addpath('util');

	G = dlmread('class');
	F = dlmread('features');

	svm_struct = crossvalidate(F, G);
