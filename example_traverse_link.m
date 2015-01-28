% Example traversal of image and link detection with training images size 30x30

addpath('histogram');
addpath('emd');
addpath('util');
addpath('main');

train_folder = 'data_sets/train-30/';
test_folder = 'data_sets/test-30/';

svm_struct = train(train_folder, 'struct-30.mat');

I_orig = imread('images/1.jpg','jpg');

[N, I] = traverse_image(I_orig, 30, svm_struct);

link(I,N);
