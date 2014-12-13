function [V] = image_single_gradient ( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    % I = imread('/home/soeholm/MLCV/UWO-MLCV/images/preview.jpg', 'jpeg');
    % I = rgb2gray(I);
    %imshow(I);
    
    %I = edge(I,'canny',0.4);

    % Find 0 pixels
    Z = find(~I);
    
    % Calculate gradient direction
    [~, Gdir] = imgradient(I);
    %figure;
    imshowpair(I, Gdir, 'montage');

    I = double(I);
    
    % Vector for histogram    
    V = zeros(size(I)-size(Z));
    v = 1;
    
    % Binsize
    b = 20;
    
    [width,height] = size(I);
    
    % Go through matrix of gradient directions
    for i = 1:width*height
        
        % If not a 0 pixel ...
        if ~ismember(i,Z)

            % Include in histogram
            p = Gdir(i);
           
            % Decide the bin
            V(v) = floor(p./b)*b;
            v = v+1;
        end
    end