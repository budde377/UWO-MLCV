function [  ] = example_train_60( )

	addpath('histogram');
	addpath('emd');
	addpath('util');

	train('data_sets/train-60', 'struct-60');

end

