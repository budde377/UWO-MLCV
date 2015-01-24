function [  ] = plot_image_and_circs( I, N )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    figure;
    imshow(I);
    hold on
    [rows, ~] = size(N);
    for ni = 1:rows
        n = N(ni, :);  
        plot(n(2)+n(3)/2,n(1)+n(3)/2,'r.','MarkerSize',20)
        text(n(2)+n(3)/2,n(1)+n(3)/2,int2str(ni))
    end
    hold off

end

