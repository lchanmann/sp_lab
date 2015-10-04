function [ J ] = find_jump( energy, q1, q2 )
% FIND_JUMP find jump position in energy profile
%       q1 - Energy threshold
%       q2 - Frames jump threshold
%
% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 09/29/2015

I = find(energy > q1);
J = [I(1) 0]; % energy jump positions

T = length(I);
for t=2:T
    if I(t-1) + q2 < I(t)
        J(end, 2) = I(t-1);
        J(end+1, 1) = I(t);
    end
end
J(end, 2) = I(T);

% % Plot J
% [L,~] = size(J);
% figure;
% hold on;
% for l=1:L
%     plot(J(l,1):J(l,2), energy(J(l,1):J(l,2)));
% end
% hold off;