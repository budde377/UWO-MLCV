% Example traversal of image with training images size 30x30

addpath('histogram');
addpath('emd');
addpath('util');

train_folder = 'data_sets/train-30/';
test_folder = 'data_sets/test-30/';

svm_struct = train(train_folder, 'struct-30.mat');

I = imread('images/1.jpg','jpg');

display(traverse_image(I, 30, svm_struct));
