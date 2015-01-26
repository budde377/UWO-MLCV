% Example traversal of image with training images size 30x30

addpath('histogram');
addpath('emd');
addpath('util');
addpath('main');

I_orig = imread('images/1.jpg','jpg');

N = [55-46/2,87-46/2,46; 43-43/2,142-43/2,43; 61-34/2,226-34/2,34; 89-24/2,177-24/2,24; 100-14/2,122-14/2,14; 123-34/2,225-34/2,34; 140-24/2,167-24/2,24; 163-36/2,91-36/2,36; 186-34/2,138-34/2,34];

link(I,N);
