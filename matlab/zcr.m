function [ zc ] = zcr( x, xn_1 )
% zcr - Compute Zero-Crossing rate of samples
%       x       - samples
%       xn_1    - x(n+1)
%
% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 10/08/2015

x_shifted = [x(2:end); xn_1];
zc = nnz(x .* x_shifted < 0);