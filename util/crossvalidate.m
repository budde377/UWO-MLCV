function [name, value] = crossvalidate ( xdata, group )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	% Split data
	k = 10;
	[height,width] = size(xdata);
	rng(0,'twister');
	r = randi([0 10],1,height);
	r_range = [min(r) max(r)];

	D = zeros(1,3);

	name = 'kernel_function';
	F = {'linear','quadratic','polynomial'};

	for f = 1:3	
		for i = 1:k
			xdata_train = [1];
			group_train = group(1,1);
			n = 1;

			xdata_test = [1];
			group_test = group(1,1);
			m = 1;

			for j = 1:height
				if i == r(j)	
					xdata_test(m,1:width) = xdata(j,1:width);
					group_test(m,1:end) = group(j,1);
					m = m+1;
				else
					xdata_train(n,1:width) = xdata(j,1:width);
					group_train(n,1:end) = group(j,1);
					n = n+1;
				end
			end
		
			svm_struct_train = svmtrain(xdata_train, group_train, name, F{f});

			Group = svmclassify(svm_struct_train, xdata_test);
		
			d = 0;
			[h,~] = size(Group);
			for l = 1:h
				if ~(strmatch(Group(l,1), group_test(l,1)))
					d = d+1;
				end
			end
			D(f) = D(f) + d;
		end

		D(f) = D(f)./k;
	end

	[~,y] = find(D == min(min(D)));
	value = F{1,y(1)};

