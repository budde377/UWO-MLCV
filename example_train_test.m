% Example shows ...

addpath('histogram');
addpath('emd');
addpath('util');

train_folder = 'data_sets/train-30/';
test_folder = 'data_sets/test-30/';

svm_struct = train(train_folder, 'struct-30.mat');

display(test(test_folder, svm_struct));
