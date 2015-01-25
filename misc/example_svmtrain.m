function [svm_struct] = example_svmtrain ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('util');

	load fisheriris
	xdata = meas(51:end,3:4);
	group = species(51:end);

	[name,value] = crossvalidate(xdata, group);

	svm_struct = svmtrain(xdata, group, name, value);

	
