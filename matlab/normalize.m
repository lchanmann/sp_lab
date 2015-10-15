function [ z ] = normalize( x )
% normalize - scale to [0,1]
a = min(x);
b = max(x);

z = (x-a) / (b-a);