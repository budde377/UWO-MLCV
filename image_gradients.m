function [V] = image_gradients ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    I = imread('/home/soeholm/MLCV/UWO-MLCV/images/preview.jpg', 'jpeg');
    I = rgb2gray(I);
    I = edge(I,'canny',0.4);    
    imshow(I);
    
    I1 = I(1:end/2,1:end/2);
    figure;
    imshow(I1);
    
    V1 = image_single_gradient(I1);
    figure;
    hist(V1);