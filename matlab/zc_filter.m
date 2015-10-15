function [ J ] = zc_filter( J, zc, m )
% zc_filter - zero-crossing filter

[N,~] = size(J);
c = zeros(N, 1);
for i=1:N
    c(i) = mean( zc(J(i,1):J(i,2)) );
end

J = J(c > m,:);