% Example training with training images size 30x30

addpath('histogram');
addpath('emd');
addpath('util');
addpath('main');

train('data_sets/train-30', 'struct-30.mat');
