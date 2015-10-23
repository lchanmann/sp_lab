function [ p ] = normal( X, m, sigma )
% normal - Probability density function for normal distribution

e = -0.5 * ((X - m).^2) ./ sigma;
p = 1/(sqrt(2*pi) * sigma) * exp(e);