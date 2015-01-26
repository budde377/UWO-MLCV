function [ Groups, I_orig ] = traverse_image( I_orig, box_size, svm_struct )

% TRAVERSE IMAGE
% This function traverses image 'I' and classifies
% each subimage as 'Node' or 'Not node'

	step = 15;
	resize_scale = 0.1;
	down_size = 300;
	min_scale = 0.01;

	%FIND
	display('STARTING SEARCH');

	% Downscale image if necessary
	[h, w, ~] = size(I_orig);
	if max(h, w) > down_size;
		I_orig = imresize(I_orig, [down_size*(h/w), down_size]);
	end

	I = rgb2gray(I_orig);

	% Find nodes
	N = find_nodes_in_image(resize_scale, I, box_size, step, svm_struct, min_scale);
   	
	[s, ~] = size(N(:,1));
	G = zeros(1,s);

	% Group found nodes according to containment
	for i = 1:s
		% Calculate node 'n1' center coordinates		
		xy1 = N(i,:);
		x1 = xy1(1);
		y1 = xy1(2);
		d1 = xy1(3);

		n1 = [x1 + d1/2, y1 + d1/2];

		for j = 1:s
			% Calculate node 'n2' center coordinates
			xy2 = N(j,:);
			x2 = xy2(1);
			y2 = xy2(2);
			d2 = xy2(3);
		
			n2 = [x2 + d2/2, y2+ d2/2];

			d = sqrt((n1(1)-n2(1))^2+(n1(2)-n2(2))^2);

			if G(j) == 0 && d < min(d1, d2)
				% Group nodes
				if G(i) == 0					
					G(j) = i;
				else 
					G(j) = G(i);
				end
			end
		end
		
	end

	Group_sum = zeros(s,3);
	Group_count = zeros(s,1);
	s = numel(G);

	% Average the groups to find more precise nodes
	for i = 1:s
		g = G(i);
		n = N(i,:);

		Group_sum(g,:) = Group_sum(g,:) + n;
		Group_count(g) = Group_count(g) + 1;
	end
	
	Groups = [];
	for i = 1:s
		if Group_count(i) > 0
			avg = Group_sum(i, :) / Group_count(i);
			Groups = [Groups; avg];
		end
	end

%	display(G);
%	display(Group_sum);
%	display(Group_count);
%	display(Nmm);

	plot_image_and_circs(I_orig, N);
	plot_image_and_circs(I, Groups);

end

