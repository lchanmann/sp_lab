function [ J ] = duration_filter( J, duration )
% duration_filter - constraint duration (in number of frames)
%
% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 10/08/2015

L = J(:,2) - J(:,1);
J = J(L > duration, :);