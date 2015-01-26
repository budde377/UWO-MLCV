% Example testing with training and testing images size 30x30

addpath('histogram');
addpath('emd');
addpath('util');
addpath('main');

train_folder = 'data_sets/train-60/';
test_folder = 'data_sets/test-60/';

svm_struct = train(train_folder, 'struct-60.mat');

display(test(test_folder, svm_struct));
