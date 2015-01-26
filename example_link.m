% Example traversal of image with training images size 30x30

addpath('histogram');
addpath('emd');
addpath('util');
addpath('main');

train_folder = 'data_sets/train-30/';
test_folder = 'data_sets/test-30/';

svm_struct = train(train_folder, 'struct-30.mat');

I_orig = imread('images/1.jpg','jpg');

[N, I] = traverse_image(I_orig, 30, svm_struct);

%N = [975,600,100;1525,465,100;2455,685,100;1920,960,100;985,1750,100;2460,1330,100;1500,2015,100;1830,1500,100;1320,1070,100];

link(I,N);
