function [ sgs ] = chopDiscrete( signal )
%CHOPPER Summary of this function goes here
%   Detailed explanation goes here
% http://www.mathworks.com/help/dsp/examples/envelope-detection.html

threshold = 0.8;
bs = 128;
count = ceil(length(signal)/bs);
signal(count*bs) = 0;

raw = mat2cell(signal,[1],bs* ones(1,count));
p = cellfun(@(s) sum(s.*s)/length(s),raw);
sgs = raw(p > threshold);
end

