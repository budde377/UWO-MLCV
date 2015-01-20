function [ fs, w ] = histogram_to_signature( v )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    fs = [];
    w = [];
    for i = 1:size(v,2)
        item = v(i);
        if ~ismember(item,fs)
            fs = [fs item];            
            w = [w 1];
        else 
            pos = find(fs == item,1,'first');
            w(pos) = w(pos)+1;            
        end
    end
    w_sum = sum(w);
    for i = 1:size(w,2)
        w(i) = w(i)/w_sum;
    end
    w = transpose(w);
    fs = transpose(fs);
end

