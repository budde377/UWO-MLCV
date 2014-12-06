function [v] = load_images_from( folder )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    img_type = '/*.jpg';
    img_path = '/home/soeholm/Matlab/MLCV/';
    img_dir = strcat(img_path, folder, img_type);
    images = dir(img_dir);
    v = [];
    for i = 1:length(images)
        img_name = strcat(img_path, folder, '/', images(i).name);
        v(end+1) = imread(img_name);
    end
end

