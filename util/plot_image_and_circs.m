function [  ] = plot_image_and_circs( I, N )

    figure;
    imshow(I);
    hold on
    [rows, ~] = size(N);
    for ni = 1:rows
        n = N(ni, :);  
        %lot(n(2)+n(3)/2,n(1)+n(3)/2,'r.','MarkerSize',20)
        rectangle('Position', [n(2),n(1),n(3), n(3)]);
        text(n(2)+n(3)/2,n(1)+n(3)/2,int2str(ni))
    end
    hold off

end

