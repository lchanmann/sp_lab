function [ z ] = unit( x )
% unit - compute unit length scaling

l = sqrt(x*x');
z = x / l;