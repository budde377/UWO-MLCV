function [ ] = example_traverse_image( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    addpath('util');
    addpath('emd');
    addpath('histogram');

    box_size = 30;
    step = 5;
    
    %TRAIN

    display('STARTING TRAIN');

    [G, F] = generate_data_matrixes('data_sets/data_sets/train/n/', 'data_sets/data_sets/train/nn/', '*.png');

	[name,value] = crossvalidate(F, G);

	svm_struct = svmtrain(F, G, name, value);

    %FIND
    
    display('STARTING FIND');
    Io = imread('images/1.jpg');
    [h,w,~] = size(Io);
    down_size = 500;
    if max(h,w) > down_size;
        Io = imresize(Io,[down_size*(h/w),down_size]);
    end 
    I = rgb2gray(Io);

    
    
    classify = @(x) svmclassify(svm_struct,x);
    
    N = find_nodes_in_image_diff_size(0.5, I, box_size, step, classify);
    figure;
    imshow(Io);
    hold on
    [rows, ~] = size(N);
    for ni = 1:rows
        n = N(ni, :);  
        plot(n(2)+n(3)/2,n(1)+n(3)/2,'r.','MarkerSize',n(3))
    end
    hold off
    
    display(N);
end

