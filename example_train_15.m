function [  ] = example_train_15()

	addpath('histogram');
	addpath('emd');
	addpath('util');

	train('data_sets/train-15', 'struct-15');

end

