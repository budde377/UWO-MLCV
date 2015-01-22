function [  ] = example_traverse_image( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    I = imread('images/1.jpg');
    I2 = rgb2gray(I);

    subplot(1,2,1), imshow(I);
    subplot(1,2,2), imshow(I2);
    edge(I2,'canny',0.4)
end

