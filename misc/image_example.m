function [features] = image_example ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    I = imread('/home/soeholm/MLCV/UWO-MLCV/images/IMG_20141128_143836b.jpg', 'jpeg');
    I = rgb2gray(I);
    imshow(I);
    
    I_s_v = edge(I,'sobel',0.08,'vertical');
    figure;
    imshow(I_s_v);
    
    I_s_h = edge(I,'sobel',0.08,'horizontal');
    figure;
    imshow(I_s_h);
    
    I_c = edge(I,'canny',0.4);
    figure;    
    imshow(I_c);
    
    features_normal = hog_feature_vector(I);
    figure;
    plot(features_normal);
    
    features_sobel_vertical = hog_feature_vector(I_s_v);
    figure;
    plot(features_sobel_vertical);
    
    features_sobel_horizontal = hog_feature_vector(I_s_h);
    figure;
    plot(features_sobel_horizontal);
    
    features_canny = hog_feature_vector(I_c);
    figure;
    plot(features_canny);
    
    %figure;
    %imshow(I);
    %hold on;
    %plot(hogVis);
end