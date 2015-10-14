% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 09/25/2015

clc;
clear;
close all;

% add current directory to path
addpath(pwd);

fid = fopen('time_marks.txt', 'w');
frame_width = 10; % frame_width = 10ms
frames_per_second = 1000 / frame_width;
wav_dir = '../wav/';

tic;
files = dir([wav_dir '*.wav']);
C = length(files);
words = zeros(1, C);

% q1 - energy threshold
% q1 = 1.2; % exp(sqrt(x'x));
% q1 = 0.2; % sqrt(x'x);
q1 = 0.05;
q2 = 100; % frame jump threshold
for i=1:C
    filename = files(i).name;
    % print filename
    fprintf('%d. Filename: %s\n', i, filename);
    wav = audioinfo([wav_dir filename]);
    energy = energy_profile(wav, frame_width);
    % energy jumps
    J = find_jump(energy, q1, q2);
    J = duration_filter(J, 0.1 * frames_per_second);
    J = sil_padding(J, [20 40]);
    M = tm(J, frames_per_second);
    words(i) = size(M, 1);
    display(['(' num2str(words(i)) ') words.']);
    % write to time_marks.txt
    fprintf(fid, ['%' num2str(length(filename)) 's\n'], filename);
    fprintf(fid, '%0.3f %0.3f\n', M');
    fprintf('\n\n');
end
fclose(fid);
toc

% words
display(q1);
display(q2);
display(words);