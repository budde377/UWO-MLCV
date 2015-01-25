function [ ] = example_traverse_image( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    addpath('util');
    addpath('emd');
    addpath('histogram');

    box_size = 30;
    step = 15;
    resize_scale = 0.1;
    
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
        svm_struct = crossvalidate(F, G);
        save(struct_file, 'svm_struct');
    end

    %FIND
    
    display('STARTING FIND');
    Io = imread('images/1.jpg','jpeg');
    [h,w,~] = size(Io);
    down_size = 300;
    if max(h,w) > down_size;
        Io = imresize(Io,[down_size*(h/w),down_size]);
    end 
    I = rgb2gray(Io);

    
    
    classify = @(x) svmclassify(svm_struct,x) == 1;
    
    N = find_nodes_in_image_diff_size(resize_scale, I, box_size, step, classify, 0.01);
   
    
    
    s = size(N(:,1));
    M = zeros(1,s);
    for i = 1:s
        n1 = N(i,:);
        d1 = n1(3);
        n1 = n1 + [d1/2, d1/2, 0];
        for j = 1:s
            n2 = N(j,:);
            d2 = n2(3);
            n2 = n2 + [d2/2, d2/2, 0];
            if M(j) == 0 && sqrt((n1(1)-n2(1))^2+(n1(2)-n2(2))^2) < min(d1, d2)
                if M(i) == 0
                    M(j) = i;
                else 
                    M(j) = M(i);
                end
            end
        end
        
    end
    Nm = zeros(s,3);
    Nsum = zeros(s,1);
    for i = 1:numel(M)
        Nm(M(i),:) = Nm(M(i),:)+N(i,:);
        Nsum(M(i)) = Nsum(M(i))+1;
    end
    
    Nmm = [];
    for i = 1:numel(Nsum)
        if Nsum(i) > 0
            Nmm = [Nmm; Nm(i, :) / Nsum(i)];
        end
    end
    display(M);
    display(Nm);
    display(Nsum);
    display(Nmm);
    plot_image_and_circs(Io, N);
    plot_image_and_circs(Io, Nmm);

end

