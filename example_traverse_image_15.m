% Example traversal of image with training images size 30x30

addpath('histogram');
addpath('emd');
addpath('util');
addpath('main');

train_folder = 'data_sets/train-15/';
test_folder = 'data_sets/test-15/';

svm_struct = train(train_folder, 'struct-15.mat');

I = imread('images/1.jpg','jpg');

traverse_image(I, 15, svm_struct);
