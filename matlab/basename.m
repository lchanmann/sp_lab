function [ filename ] = basename( path )
% basename - get filename from path

last_slash = find(path == '/',1, 'last');
filename = path(last_slash+1:end);