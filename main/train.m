function [ svm_struct ] = train( folder, struct_file)

% TRAIN
% Blablabla
	
	use_file = nargin == 2;
	positive_url = [folder '/n/'];
	negative_url = [folder '/nn/']; 

	% Load svm struct if already created. 
	if use_file && exist(struct_file, 'file') == 2
		load(struct_file,  'svm_struct');
	else
		[G, F] = generate_data_matrixes(positive_url, negative_url, '*.png');
		svm_struct = crossvalidate(F, G);
		if use_file
			save(struct_file, 'svm_struct');
		end
	end

end

