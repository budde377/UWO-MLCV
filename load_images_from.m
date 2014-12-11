function [v] = load_images_from( folder )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    img_type = '/*.jpg';
    img_path = '/home/soeholm/MLCV/UWO-MLCV/';
    img_dir = strcat(img_path, folder, img_type);
    images = dir(img_dir);
    l = length(images);
    v = repmat(struct('name','','data',[]), l, 1);
    c = 1;
    for i = 1:length(images)
        img_name = strcat(img_path, folder, '/', images(i).name);
        I = imread(img_name, 'jpeg');
        I = rgb2gray(I);
        imshow(I);
        s = struct('name',img_name,'data',I);
        v(c) = s;
        c = c+1;
    end
end