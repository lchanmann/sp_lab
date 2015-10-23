function [ K ] = gaussian_kernel( X )

l = length(X);
K = zeros(l, l);
for i=1:l
    m = X(i);
    K(:, i) = 1/(sqrt(2*pi)) * exp((X' - m).^2/-2);
end