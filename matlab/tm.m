function [ M ] = tm( J, frames_per_second )
% TM Convert engery position to time marks
%    J - engery position (in term of frame)
%
% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 09/29/2015

M = J / frames_per_second;
M(:,2) = M(:,2) - M(:,1);