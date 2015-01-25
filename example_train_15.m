% Example training with training images size 15x15

addpath('histogram');
addpath('emd');
addpath('util');
addpath('main');

train('data_sets/train-15', 'struct-15.mat');
