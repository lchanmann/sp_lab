clc;
clear all;
close all;

files = dir('test-*.wav');
C = length(files);

X = 0:80; % axis range
H = zeros(length(X), C);
K = gaussian_kernel(X);

figure;
for i=1:C
    filename = files(i).name;
    % print filename
    fprintf('%d. Filename: %s\n', i, filename);
    wav = audioinfo(filename);
    
    [ energy, zc ] = energy_profile(wav, 10);
    disp(' ');
    
    H(:,i) = hist(zc, X);
    k = K * H(:,i);
    m = mean(zc);
    sigma = var(zc, 1);
    N = normal(X, m, sigma);
    
    subplot(C, 1, i);
    plot(H(:,i)); hold on;
    plot(k, 'm:');
    plot(N*60*30, 'k');
    hold off;
    xlim([min(X) max(X)]);
    ylim([0 60]);
    title(filename);
    legend('Histogram', 'Gaussian kernel', 'Gaussian', 'Location', 'Best');
end
hold off;