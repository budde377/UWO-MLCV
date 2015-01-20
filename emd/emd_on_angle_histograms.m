function [ f,f_val ] = emd_on_angle_histograms( H1,H2 )
    
	addpath('../util');
    
	[F1, W1] = histogram_to_signature(H1);
	[F2, W2] = histogram_to_signature(H2);
    
    % Calculating the distance between the histograms. 
    % The functions finds the smallest angle between the 
    % degrees, wrt the periodic nature of an angle. 
	[f, f_val] = emd(F1, F2, W1, W2,@(h1, h2) min(abs(h1-h2),abs(360-h1+h2)));
    
end

