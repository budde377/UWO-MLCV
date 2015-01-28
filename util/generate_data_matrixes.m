function [ G, F ] = generate_data_matrixes( positive_path, negative_path, file_type)

	Is = load_images_from_folder(positive_path, file_type);
	Dpos = generate_feature_matrix(Is);
	[s1,~] = size(Dpos);
	
	Is = load_images_from_folder(negative_path, file_type);
	Dneg = generate_feature_matrix(Is);
	[s2, ~] = size(Dneg);
	
	G(1:s1,1) = 1;
	G(s1+1:s1+s2) = -1;
	F = [Dpos;Dneg];
	
end

