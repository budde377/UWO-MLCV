function [  ] = example_train_30()

	addpath('histogram');
	addpath('emd');
	addpath('util');

	train('data_sets/train-30', 'struct-30');
	
end

