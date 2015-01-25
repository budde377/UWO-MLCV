function [svm_struct] = crossvalidate ( xdata, group )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	% Split data
	k = 10;
	[height,width] = size(xdata);
	r = randi([0 10],1,height);
	r_range = [min(r) max(r)];

	D = zeros(3);
	S = cell(3);

	n1 = 'kernel_function';
	F = {'linear','quadratic','polynomial'};
	n2 = 'method';
	G = {'QP','SMO','LS'};
	n3 = 'options';
	opt = statset('MaxIter', 1000000);

	for g = 1:3
		for f = 1:3		
			S1 = cell(1,10);
			D1 = zeros(1,10);	
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
				success = true;
				try
					svm_struct_train = svmtrain(xdata_train, group_train, n1, F{f},n2,G{g}, n3, opt);
				catch err
					disp([F{f} ' failed on group ' num2str(i) ' of ' num2str(k)])
					success = false;
				end
				if success
                    S1{1,i} = svm_struct_train;
					Group = svmclassify(svm_struct_train, xdata_test);

					d = 0;
					[h,~] = size(Group);
					for l = 1:h					
						if ~(Group(l,1) == group_test(l,1))
							d = d+1;
						end
					end
					D1(1,i) = d;
					D(f,g) = D(f,g) + d;
				else 
					[s, ~] = size(xdata_test);
					D1(1,i) = s;
					D(f,g) = D(f,g) + s;
				end 
			end

			D(f,g) = D(f,g)./k;
			[x,y] = find(D1 == min(min(D1)));
            S{f,g} = S1{x(1),y(1)};
		end
	end

	display(D);
	[x,y] = find(D == min(min(D)));
   	svm_struct = S{x(1),y(1)};
    

