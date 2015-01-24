function [svm_struct] = example_lines ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('util');

	I = imread('images/2b8e601a-4f94-4e43-8013-3f28c5784224.png', 'png');
	I = rgb2gray(I);
	BW = edge(I,'canny',0.4);
	
	[H, t, r] = hough(BW);
	P = houghpeaks(H);%, 20, 'threshold', ceil(0.3*max(H(:))));

	x = t(P(:,2));
	y = r(P(:,1));

	lines = houghlines(BW, t, r, P);%, 'FillGap', 60, 'Minlength', 200);

	figure, imshow(BW), hold on
	max_len = 0;
	for k = 1:length(lines)
		xy = [lines(k).point1; lines(k).point2];
		plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

		% Plot beginnings and ends of lines
		plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
		plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

		% Determine the endpoints of the longest line segment
		len = norm(lines(k).point1 - lines(k).point2);
		if ( len > max_len)
			max_len = len;
			xy_long = xy;
		end
	end
