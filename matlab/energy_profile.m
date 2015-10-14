function [ energy, zero_crossing_rate ] = energy_profile (audio, frame_width)
% energy_profile - Compute engery profile and zero_crossing rate of a wav file
%
% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 09/29/2015

samples_per_frame = audio.SampleRate/1000 * frame_width;
total_frames = ceil(audio.TotalSamples / samples_per_frame);
energy = zeros(1, total_frames);
zero_crossing_rate = zeros(1, total_frames);

fprintf('Starting energy profiling');
Y = audioread(audio.Filename);
for t=1:total_frames
    start = samples_per_frame * (t-1) + 1;
    finish = start + samples_per_frame - 1;
    n_1 = finish + 1;
    if finish > audio.TotalSamples
        finish = audio.TotalSamples;
        n_1 = finish;
    end

    samples = start:finish;
    y = Y(samples);
    energy(t) = engy(y);
    zero_crossing_rate(t) = zcr(y, Y(n_1));
    % print progress (.)
    progress(t, total_frames);
end
fprintf('\n');

% % Plot
% figure;
% hold on;
% plot(1:total_frames, log(zero_crossing_rate), 'r');
% plot(1:total_frames, energy, 'b-.');
% plot(1:total_frames, sqrt(energy), 'g');
% title(['Zero-crossing rate and Energy profile: ' basename(audio.Filename)]);
% xlabel('Frame (10ms each)');
% legend('ZCR', 'E', 'sqrt(E)');
% hold off;
% 
% function [ filename ] = basename( path )
% % basename - get filename from path
% last_slash = find(path == '/',1, 'last');
% filename = path(last_slash+1:end);