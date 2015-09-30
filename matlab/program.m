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

tic;
files = dir('../wav/*.wav');
for i=1:length(files)
    filename = files(i).name;
    % print filename
    fprintf('%d. Filename: %s\n', i, filename);
    wav = audioinfo(filename);
    energy = energy_profile(wav, frame_width);
    % energy jumps
    J = find_jump(energy, 0.05, 80);
    J = sil_padding(J, 40);
    M = tm(J, frames_per_second);
    % write to time_marks.txt
    fprintf(fid, ['%' num2str(length(filename)) 's\n'], filename);
    fprintf(fid, '%0.3f %0.3f\n', M');
    fprintf('\n\n');
end
fclose(fid);
toc