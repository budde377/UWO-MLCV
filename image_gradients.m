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
    
    I2 = I(end/2:end,1:end/2);
    figure;
    imshow(I2);
    
    V2 = image_single_gradient(I2);
    figure;
    hist(V2);
    
    I3 = I(1:end/2,end/2:end);
    figure;
    imshow(I3);
    
    V3 = image_single_gradient(I3);
    figure;
    hist(V3);
    
    I4 = I(end/2:end,end/2:end);
    figure;
    imshow(I4);
    
    V4 = image_single_gradient(I4);
    figure;
    hist(V4);