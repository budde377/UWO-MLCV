function [V] = image_single_gradient ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    % I = imread('/home/soeholm/MLCV/UWO-MLCV/images/preview.jpg', 'jpeg');
    I = rgb2gray(I);
    %imshow(I);
    
    I = edge(I,'canny',0.4);

    % Find 0 pixels
    Z = find(~I);
    
    % Calculate gradient direction
    [Gmag, Gdir] = imgradient(I);
    %figure;
    imshowpair(I, Gdir, 'montage');

    I = double(I);
    
    % Vector for histogram
    V = zeros(size(I)-size(Z));
    
    % Binsize
    b = 20;
    
    [width,height] = size(I);
    
    % Go through matrix of gradient directions
    for i = 1:width*height
        
        % If not a 0 pixel ...
        if ~ismember(i,Z)

            % Include in histogram
            p = Gdir(i);
            
            % Min bin value
            d = -180;

            % Decide the bin
            while d <= 180
                if p <= d
                    V(end+1) = d;
                    d = -180; 
                    break
                else
                    d = d + b;
                end
            end
        end
    end
    
    figure;
    hist(V);