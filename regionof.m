function [ r ] = regionof ( x, y, w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    a = w/2;
    b = 0.5*x + w/4;
    c = x;
    d = 2*x - w/2;
    e = w/2; % f(y)
    f = -2*x + 1.5*w;
    g = -x + w;
    h = -1/2*x + 0.75*w;
    
    is_top = a >= y;
    is_left = e >= x;
    is_157 = h >= y;
    is_135 = g >= y;
    is_112 = f >= y;    
    is_67 = d >= y;
    is_45 = c >= y;
    is_22 = b >= y;
    
    if is_top
        if is_left
            if is_45
                if ~is_67
                    r = 1;
                else
                    r = 2;
                end
            else
                if ~is_22
                    r = 15;
                else
                    r = 16;
                end
            end
        else
            if is_135
                if is_112
                    r = 3;
                else
                    r = 4;
                end
            else
                if is_157
                    r = 5;
                else
                    r = 6;
                end
            end
        end
    else
        if ~is_left
            if is_45
                if is_22
                    r = 7;
                else
                    r = 8;
                end
            else
                if is_67
                    r = 9;
                else
                    r = 10;
                end
            end
        else
            if ~is_135
                if ~is_112
                    r = 11;
                else
                    r = 12;
                end
            else
                if ~is_157
                    r = 13;
                else
                    r = 14;
                end
            end
        end
    end
