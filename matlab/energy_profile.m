function [ energy ] = energy_profile (audio, frame_width)
% ENERGY_PROFILE - Compute engery profile of a wav file
%
% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 09/29/2015

samples_per_frame = audio.SampleRate/1000 * frame_width;
total_frames = ceil(audio.TotalSamples / samples_per_frame);
energy = zeros(1, total_frames);

fprintf('Starting energy profiling');
for t=1:total_frames
    start = samples_per_frame * (t-1) + 1;
    finish = start + samples_per_frame - 1;
    if finish > audio.TotalSamples
        finish = audio.TotalSamples;
    end

    samples = [start finish];
    [y,~] = audioread(audio.Filename, samples);
    energy(t) = y' * y;
    % print progress (.)
    progress(t, total_frames);
end
fprintf('\n');

% % Plot energy profile
% figure;
% plot(1:total_frames, energy);
% title('Six words wav energy profile');
% xlabel('Frame (10ms each)');
% ylabel('Engery');