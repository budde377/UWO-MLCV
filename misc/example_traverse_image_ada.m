function [ ] = example_traverse_image_ada( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    addpath('util');
    addpath('emd');
    addpath('histogram');

    box_size = 30;
    step = 15;
    resize_scale = 0.05;
    
    struct_file = 'struct.mat';
    
    % TRAIN
    % Load svm struct if already created. 
    if exist(struct_file, 'file') == 2
        load(struct_file,  'svm_struct');
    else
        display('STARTING TRAIN');
        [G, F] = generate_data_matrixes('data_sets/data_sets/train/n/', 'data_sets/data_sets/train/nn/', '*.png');
%        G = dlmread('class');
%        F = dlmread('features');
       % svm_struct = crossvalidate(F, G);
        svm_struct = crossvalidate_ada(F,G, 50000); 
       save(struct_file, 'svm_struct');
    end

    %FIND
    
    display('STARTING FIND');
    Io = imread('images/1.jpg');
    [h,w,~] = size(Io);
    down_size = 300;
    if max(h,w) > down_size;
        Io = imresize(Io,[down_size*(h/w),down_size]);
    end 
    I = rgb2gray(Io);

    
    
    classify = @(x) adaboost('apply', x, svm_struct) == 1;
    
    N = find_nodes_in_image_diff_size(resize_scale, I, box_size, step, classify, 0.8);
    %N = find_nodes_in_image( I, box_size, step, classify);
   
%    s = size(N(:,1));
%    M = zeros(s);
%    for i = 1:s
%        n1 = N(i,:);
%        for j = 1:s
%            n2 = N(j,:);
%            M(i,j) = sqrt((n1(1)-n2(1))^2+(n1(2)-n2(2))^2) < n1(3) && n1(3) <= n2(3);
%        end
        
%    end
%    Nm = [];
%    for i = 1:s
%        for j = i+1:s
%            if M(i,j) == 1 && M(j,i) == 1
%                
%                Nm = [Nm; (N(i, :)+N(j, :))/2];
%            end
%         
%        end
%    end 
%    display(M);
    plot_image_and_circs(Io, N);
end

