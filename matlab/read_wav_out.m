% SP_Lab - University of Missouri-Columbia
% Chanmann Lim
% 10/16/2015

wav_dir = '../ruby/wav_out/';

files = dir([wav_dir '*.wav']);
C = length(files);
words = zeros(1, C);

i = 1;
while i <= C
    filename = files(i).name;
    fprintf('%d. Playing: %s\n', i, filename);
    
    [Y, Fs] = audioread([wav_dir filename]);
    i = i + 1;
    
    while (true)
        sound(Y, Fs);
        k = input('Correct? Y/N [n]: ', 's');
        goto = str2double(k);
        
        if isempty(k) || strcmpi(k, 'y')
            break;
        elseif goto > 0
            i = goto;
            break;
        end
    end
    disp(' ');
end

% % % errors
% % e = [305 385 390 426 481 482 598 600 688 693 760 766 768 777 798 853 985 1086 1094 1107 ...
% %      1171 1178 1266 1290 1305 1306 1314 1343 1370 1400 1408 1509 1524 1591 1874 1895 ...
% %      1916 1951 1952 1971 1976 2007 2009 2044 2097 2180 2211 2299 2452 2647 2674 2677];