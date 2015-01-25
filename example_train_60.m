% Example training with training images size 60x60

addpath('histogram');
addpath('emd');
addpath('util');
addpath('main');

train('data_sets/train-60', 'struct-60.mat');
