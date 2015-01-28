function [ d, G, Greal] = test( test_folder, svm_struct )

% TEST
% Classifies the test data giving the specified svm_struct

	% Get test data
	positive_url = [test_folder '/n/'];
	negative_url = [test_folder '/nn/']; 
	[G, F] = generate_data_matrixes(positive_url, negative_url, '*.png');

	Greal = svmclassify(svm_struct, F);

	% Calculate error rate
	d = 0;
	for l = 1:numel(Greal)					
		if ~(Greal(l,1) == G(l,1))
			d = d+1;
		end
	end

end

