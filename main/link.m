function [L, c] = link ( I, N )

% LINK
% Blablabla

	% Get line segments
	lines = linesof(I);

	[n,~] = size(N);
	L = cell(n);
	c = 0;

	N
		
	% For all pairs of nodes
	for i = 1:n
		for j = i+1:n
			
			x1 = N(i,1);
			y1 = N(i,2);
			d1 = N(i,3);

			x2 = N(j,1);
			y2 = N(j,2);
			d2 = N(j,3);

			% Plot nodes on image
			%plot(x1, y1, 'r.', 'MarkerSize', 20);
			%plot(x2, y2, 'r.', 'MarkerSize', 20);
			plot(y1+d1/2,x1+d1/2,'r.','MarkerSize',20);
			plot(y2+d2/2,x2+d2/2,'r.','MarkerSize',20);
		        rectangle('Position', [y1, x1, d1, d1]);
		        rectangle('Position', [y2, x2, d2, d2]);

			c1 = 0;

			% For all line segments
			for k = 1:length(lines)

				xy1 = lines(k).point1
				x3 = xy1(1);
				y3 = xy1(2);

				xy2 = lines(k).point2
				x4 = xy2(1);
				y4 = xy2(2);
				
				%plot([x1,x2],[y1,y2],'Color','blue');

				% Distance from start of line segment to line btw nodes
				dist1 = abs((y2-y1)*x3-(x2-x1)*y3+x2*y1-y2*x1)/sqrt((y2-y1)^2+(x2-x1)^2);

				% Distance from end of line segment to line btw nodes
				dist2 = abs((y2-y1)*x4-(x2-x1)*y4+x2*y1-y2*x1)/sqrt((y2-y1)^2+(x2-x1)^2);

				if dist1 < 50 && dist2 < 50
					L{i,j} = [L{i,j},[lines(k)]];
					c1 = c1+1;
				
					% Plot resulting link and corresponding line segment
					xy = [lines(k).point1; lines(k).point2];
					plot([x1,x2],[y1,y2],'LineWidth',2,'Color','yellow');
					plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
				end
			end

			if c1 > 0
				c = c+1;
			end
		end
	end	
	c
