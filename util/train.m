function [ svm_struct ] = train( folder, struct_file)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    positive_url = [folder '/n/'];
    negative_url = [folder '/nn/']; 
    
    % TRAIN
    % Load svm struct if already created. 
    if exist(struct_file, 'file') == 2
        load(struct_file,  'svm_struct');
    else
        display('STARTING TRAIN');
        [G, F] = generate_data_matrixes(positive_url, negative_url, '*.png');
%        G = dlmread('class');
%        F = dlmread('features');
        svm_struct = crossvalidate(F, G);
        save(struct_file, 'svm_struct');
    end

end

