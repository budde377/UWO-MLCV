function [struct] = crossvalidate_ada ( xdata, group , iter)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	% Split data
	k = 10;
	[height,width] = size(xdata);
	r = randi([0 k],1,height);

	D = zeros(1,k);
	S = cell(1,k);


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
        
        [~, str] = adaboost('train', xdata_train, group_train, iter);
        S{i} = str;
        Group = adaboost('apply', xdata_test, str);

        d = 0;
        [h,~] = size(Group);
		for l = 1:h					
			if ~(Group(l,1) == group_test(l,1))
                d = d+1;
			end
		end
		D(i) = D(i) + d;
        
       
    end


	display(D);
    struct = S{D == min(D)};
    

