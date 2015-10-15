function [ z ] = zscore( x )
% zscore - compute standard score for x
m = mean(x);
sigma = std(x, 1);
z = abs(x-m) / sigma;