function [Gmag,Gdir] = image_gradient ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    I = imread('/home/soeholm/MLCV/UWO-MLCV/images/IMG_20141128_143836b.jpg', 'jpeg');
    I = rgb2gray(I);
    %imshow(I);
    
    I = edge(I,'canny',0.4);
    %figure;    
    %imshow(I);
    
    [Gmag, Gdir] = imgradient(I);
    figure;
    %imshowpair(Gmag,Gdir,'montage');
    hist(Gdir);

    I1 = I(1:end/2,1:end/2);
    figure;
    imshow(I1);
    
    [Gmag1, Gdir1] = imgradient(I1);
    figure;
    hist(Gdir1);
    axis([-200,200,0,30]);
    

    I2 = I(end/2:end,1:end/2);
    figure;
    imshow(I2);
    
    [Gmag2, Gdir2] = imgradient(I2);
    figure;
    hist(Gdir2);
    axis([-200,200,0,30]);

    I3 = I(1:end/2,end/2:end);
    figure;
    imshow(I3);
    
    [Gmag3, Gdir3] = imgradient(I3);
    figure;
    hist(Gdir3);
    axis([-200,200,0,30]);

    I4 = I(end/2:end,end/2:end);
    figure;
    imshow(I4);
    
    [Gmag4, Gdir4] = imgradient(I4);
    figure;
    hist(Gdir4);
    axis([-200,200,0,30]);