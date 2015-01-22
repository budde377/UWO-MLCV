function [ ] = example_traverse_image( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    addpath('util');
    addpath('emd');
    addpath('histogram');

    box_size = 30;
    step = 10;

    display('STARING TRAIN');
    
    %TRAIN
    [G, F] = generate_data_matrixes('data_sets/data_sets/train/n/', 'data_sets/data_sets/train/nn/', '*.png');

	[name,value] = crossvalidate(F, G);

	svm_struct = svmtrain(F, G, name, value)

    %FIND
    
    display('STARING FIND');
    
    I = imread('images/1.jpg');
    I = rgb2gray(I);
    I = imresize(I, 0.1);

    classify = @(x) svmclassify(svm_struct, x);
    
    find_nodes_in_image_diff_size(0.5, I, box_size, step, classify)
    
end

