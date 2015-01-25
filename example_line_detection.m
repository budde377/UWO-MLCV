function [H] = example_line_detection ( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	addpath('util');

	I = imread('images/1.jpg', 'jpeg');

	lines = linesof(I);

	N = [975,600;1525,465;2455,685;1920,960;985,1750;2460,1330;1500,2015;1830,1500;1320,1070];
	[n,~] = size(N);

	L = cell(n);
	c = 0;
		
	for i = 1:n
		for j = i+1:n
			x1 = N(i,1);
			y1 = N(i,2);
			x2 = N(j,1);
			y2 = N(j,2);

			plot(x1, y1, 'r.', 'MarkerSize', 20);
			plot(x2, y2, 'r.', 'MarkerSize', 20);

			b1 = (y1-y2)/(x1-x2);
			c1 = y1 - b1*x1;


			c1 = 0;
			for k = 1:length(lines)

				xy1 = lines(k).point1
				x3 = xy1(1);
				y3 = xy1(2);
				xy2 = lines(k).point2
				x4 = xy2(1);
				y4 = xy2(2);

				b3 = (y4-y3)/(x4-x3)
				c3 = y3 - b3*x3
				
				plot([x1,x2],[y1,y2],'Color','green');

				d3 = abs((y2-y1)*x3-(x2-x1)*y3+x2*y1-y2*x1)/sqrt((y2-y1)^2+(x2-x1)^2);
				d4 = abs((y2-y1)*x4-(x2-x1)*y4+x2*y1-y2*x1)/sqrt((y2-y1)^2+(x2-x1)^2);

				if d3 < 50 && d4 < 50
					L{i,j} = [L{i,j},[lines(k)]];
					plot([x1,x2],[y1,y2],'LineWidth',4,'Color','yellow');
					c1 = c1+1;

					xy = [lines(k).point1; lines(k).point2];
					plot(xy(:,1),xy(:,2),'LineWidth',4,'Color','blue');
				end
			end

			if c1 > 0
				c = c+1;
			end
		end
	end	
	c
