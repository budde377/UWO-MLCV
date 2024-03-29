function [ F ] = generate_feature_matrix( Is )

	s = numel(Is);
	F = [];
	for i = 1:s
        I = Is{i};  

        % Calculate gradient direction
        Im = edge(I,'canny',0.4);
        [~, Gdir] = imgradient(Im);
		F(i,:) = generate_feature_vector(I, Im, Gdir); 
	end 

end

