function [ f_val ] = emd_on_angle_histograms( H1,H2 )

	[F1, W1] = histogram_to_signature(H1);
	[F2, W2] = histogram_to_signature(H2);
    
	% Calculating the distance between the histograms
	% The function finds the smallest angle between the 
	% degrees, wrt the cyclic nature of angles
	[f, f_val] = emd(F1, F2, W1, W2,@(h1, h2) min(abs(h1-h2),abs(360-h1+h2)));
    
end

