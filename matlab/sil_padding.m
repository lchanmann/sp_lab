function [ J ] = sil_padding( J, padding )
% SIL_PADDING silient padding
%       J           - energy position
%       padding     - padding frames

J(:,1) = J(:,1) - padding;
J(:,2) = J(:,2) + padding;

% make start pos non-negative
I = find(J(:,1) < 0);
J(I,1) = 0;
