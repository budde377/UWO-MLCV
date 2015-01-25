function [ d, G, Greal] = test( test_folder, svm_struct)
%TEST Summary of this function goes here
%   Detailed explanation goes here
	positive_url = [test_folder '/n/'];
    negative_url = [test_folder '/nn/']; 
	[G, F] = generate_data_matrixes(positive_url, negative_url, '*.png');

	Greal = svmclassify(svm_struct, F);

	d = 0;
	
	for l = 1:numel(Greal)					
		if ~(Greal(l,1) == G(l,1))
			d = d+1;
		end
	end

end

