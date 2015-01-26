function [lines] = linesof ( I )

	I = rgb2gray(I);
	BW = edge(I,'canny',0.4);
	
	[H, t, r] = hough(BW);
	P = houghpeaks(H, 20, 'threshold', ceil(0.3*max(H(:))));

	x = t(P(:,2));
	y = r(P(:,1));

	lines = houghlines(BW, t, r, P, 'FillGap', 60, 'Minlength', 200);

	% Plot line segments on image
	figure, imshow(I), hold on
	for k = 1:length(lines)
		xy = [lines(k).point1; lines(k).point2];
		plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

		% Plot beginnings and ends of lines
		plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
		plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
	end
