clc;
clear all;
close all;

files = dir('*.txt');
C = length(files);
for i=1:C
    disp(files(i).name);
end

% files = dir('test-*.wav');
% C = length(files);
% 
% X = 0:80; % axis range
% H = zeros(length(X), C);
% K = gaussian_kernel(X);
% 
% figure;
% for i=1:C
%     filename = files(i).name;
%     % print filename
%     fprintf('%d. Filename: %s\n', i, filename);
%     wav = audioinfo(filename);
%     
%     [ energy, zc ] = energy_profile(wav, 10);
%     disp(' ');
%     
%     H(:,i) = hist(zc, X);
%     k = K * H(:,i);
%     m = mean(zc);
%     sigma = var(zc, 1);
%     N = normal(X, m, sigma);
%     
%     subplot(C, 1, i);
%     plot(H(:,i)); hold on;
%     plot(k, 'm:');
%     plot(N*60*30, 'k');
%     hold off;
%     xlim([min(X) max(X)]);
%     ylim([0 60]);
%     title(filename);
%     legend('Histogram', 'Gaussian kernel', 'Gaussian', 'Location', 'Best');
% end
% hold off;

% x = -2.5*pi:pi/30:2.5*pi;
% 
% figure;
% plot(x, sin(x), 'r'); hold on;
% plot(x, x*0);
% axis equal;
% set(gca,'XTick', -2.5*pi:pi/2:2.5*pi)
% set(gca,'XTickLabel', {'-5pi/2','-2pi','-3pi/2','-pi','-pi/2','0','pi/2','pi','3pi/2','2pi','5pi/2'})

% m = linspace(-2, 2, 1000);
% s = sqrt(m);
% l = log10(m);
% e = log(m);
% l_2 = log2(m);
% 
% figure; hold on
% plot(m, m)
% plot(m, s, 'r')
% plot(m, l, 'g')
% plot(m, e, 'm')
% plot(m, l_2, 'k')
% legend('x', 'sqrt(x)', 'log(x)', 'ln(x)', 'log2(x)');
% axis equal;


% fs = 100;                                % Sample frequency (Hz)
% t = 0:1/fs:10-1/fs;                      % 10 sec sample
% x = (1.3)*sin(2*pi*15*t) ...             % 15 Hz component
%   + (1.7)*sin(2*pi*40*(t-2)) ...         % 40 Hz component
%   + 2.5*gallery('normaldata',size(t),4); % Gaussian noise;
% 
% m = length(x);          % Window length
% n = pow2(nextpow2(m));  % Transform length
% y = fft(x,n);           % DFT
% f = (0:n-1)*(fs/n);     % Frequency range
% power = y.*conj(y)/n;   % Power of the DFT
% 
% plot(f,power)
% xlabel('Frequency (Hz)')
% ylabel('Power')
% title('{\bf Periodogram}')




% 
% engy = zeros(1,10);
% zcr = zeros(1,10);
% 
% for i=1:10
%     from = 80*(i-1)+1;
%     to = from + 80 - 1;
%     yi = y(from:to);
%     
%     engy(i) = sqrt(yi'*yi);
%     
%     yi_shifted = [yi(2:end); 0];
%     zcr(i) = nnz(yi .* yi_shifted < 0);
% end
% 
% figure; hold on;
% plot(1:800, y);
% scatter(1:800, y, 'r');
% hold off;
% 
% figure;
% plot(1:10, engy);
% 
% figure;
% plot(1:10, zcr, 'r');
% axis equal;