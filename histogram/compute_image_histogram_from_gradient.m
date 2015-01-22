function [ H ] = compute_image_histogram_from_gradient( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    % Calculate gradient direction
	[~, Gdir] = imgradient(I);

    % Find 0 pixels
	Z = find(~I);

	
	I = double(I);
	
	% Vector for histogram	
	H = {[1],[1],[1],[1],[1],[1],[1],[1]};
	
	% Binsize
	b = 20;
	
	[width,~] = size(I);
	
	% Go through matrix of gradient directions
	for i = 1:width*width
		
		% If not a 0 pixel ...
		if ~ismember(i,Z)

			% Include in histogram			
			p = Gdir(i);
			[x,y] = ind2sub(width, i);
			
			% Decide the histogram
			r = regionof(x, y, width);
			r = ceil(r/2);
			j = int16(r);
			
			% Decide the bin
			H{j}(end+1) = floor(p./b)*b;
		end
    end
end

