% Example testing with training and testing images size 30x30

addpath('histogram');
addpath('emd');
addpath('util');
addpath('main');

train_folder = 'data_sets/train-15/';
test_folder = 'data_sets/test-15/';

svm_struct = train(train_folder, 'struct-15.mat');

display(test(test_folder, svm_struct));
