function [  ] = example_train( size )

	addpath('histogram');
	addpath('emd');
	addpath('util');

	switch size
		case 15
			% Traning on images of size 15
			train('data_sets/train-15', 'struct-15');
		case 30
			% Traning on images of size 30
			train('data_sets/train-30', 'struct-30');
		case 60
			% Traning on images of size 60
			train('data_sets/train-60', 'struct-60');
		otherwise
			display('Size must be 15, 30 or 60');
	end
end

