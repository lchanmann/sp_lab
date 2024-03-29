function [ energy, zc ] = energy_profile (audio, frame_width)
% energy_profile - Compute engery profile and zero_crossing rate of a wav file
%
%       audio - AudioInfo struct
%       frame_width - frame size in millisecond
%
% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 09/29/2015

samples_per_frame = audio.SampleRate/1000 * frame_width;
total_frames = ceil(audio.TotalSamples / samples_per_frame);
energy = zeros(1, total_frames);
zc = zeros(1, total_frames);

fprintf('Starting energy profiling');
Y = audioread(audio.Filename);
for t=1:total_frames
    start = samples_per_frame * (t-1) + 1;
    finish = start + samples_per_frame - 1;
    n_1 = finish + 1;
    if finish >= audio.TotalSamples
        finish = audio.TotalSamples;
        n_1 = finish;
    end

    samples = start:finish;
    y = Y(samples);
    energy(t) = engy(y);
    zc(t) = zcr(y, Y(n_1));
    % print progress (.)
    progress(t, total_frames);
end
fprintf('\n');

% Plot
% figure;
% hold on;
% plot(1:total_frames, zc, 'r');
% plot(1:total_frames, energy, 'b-.');
% plot(1:total_frames, sqrt(energy), 'g');
% title(['Zero-crossing rate and Energy profile: ' basename(audio.Filename)]);
% xlabel('Frame (10ms each)');
% legend('ZCR', 'E', 'sqrt(E)');
% hold off;

% % Plot [0,1] normalization
% figure;
% hold on;
% plot(1:total_frames, unit(zc));
% plot(1:total_frames, unit(energy), 'g');
% title(['Zero-crossing rate and Energy profile: ' basename(audio.Filename)]);
% xlabel('Frame (10ms each)');
% legend('ZCR', 'E');
% hold off;