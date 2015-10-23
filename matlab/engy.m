function [ energy ] = engy( x )
% Engy - compute energy from samples x
%
% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 10/08/2015

energy = 20 * log10(sqrt( x' * x ));
% energy = exp(sqrt(x' * x));
% energy = sqrt(x' * x);
% energy = x' * x;