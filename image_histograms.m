function [features_canny] = image_histograms ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    I = imread('/home/soeholm/MLCV/UWO-MLCV/images/IMG_20141128_143836b.jpg', 'jpeg');
    I = rgb2gray(I);
    imshow(I);
    
    features_normal = hog_feature_vector(I);
    figure;
    plot(features_normal);
    
    I_c = edge(I,'canny',0.4);
    figure;    
    imshow(I_c);
    
    features_canny = hog_feature_vector(I_c);
    figure;
    hist(features_canny);
    
%     [width, height] = size(I_c);
%     row_begin = 1;
%     row_end = row/8;
%     col_begin = 1;
%     col_end = col/8;
    
    
%     
%     for i = 1:8
%         I_c_1 = I_c(row_begin:row_end,col_begin:col_end);
%         figure;
%         imshow(I_c_1);
%     
%         features1 = hog_feature_vector(I_c_1);
%         figure;
%         plot(features1);
%         
%         row_begin = row_begin + width;
%         row_end = row_end + width;
%         col_begin = col_begin + height;
%         col_end = col_end + height;
%     end


    I_c_1 = I_c(1:end/2,1:end/2);
    figure;
    imshow(I_c_1);
    
    features1 = hog_feature_vector(I_c_1);
    figure;
    plot(features1);
    
    %plot(features1);
    %axis([0,9,0,0.02]);
%         
%     I_c_2 = I_c(end/2:end,1:end/2);
%     figure;
%     imshow(I_c_2);
%     
%     features2 = hog_feature_vector(I_c_2);
%     figure;
%     hist(features2);    features2 = hog_feature_vector(I_c_2);
%     figure;
%     hist(features2);
%     
%     I_c_3 = I_c(1:end/2,end/2:end);
%     figure;
%     imshow(I_c_3);
%     
%     features3 = hog_feature_vector(I_c_3);
%     figure;
%     hist(features3);
%     
%     I_c_3 = I_c(1:end/2,end/2:end);
%     figure;
%     imshow(I_c_3);
%     
%     features3 = hog_feature_vector(I_c_3);
%     figure;
%     hist(features3);
%     
%     I_c_4 = I_c(end/2:end,end/2:end);
%     figure;
%     imshow(I_c_4);
%     
%     features4 = hog_feature_vector(I_c_4);
%     figure;
%     hist(features4);