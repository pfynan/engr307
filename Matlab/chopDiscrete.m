function [ sgs ] = chopDiscrete( signal )
%CHOPPER Summary of this function goes here
%   Detailed explanation goes here
% http://www.mathworks.com/help/dsp/examples/envelope-detection.html

threshold = 0.5;
bs = 128;
count = ceil(length(signal)/bs);
signal(count*bs) = 0;

raw = reshape(signal,bs,count);
p = sum(raw.*raw,1)/bs;
sgs = num2cell(repmat(p > threshold,bs,1) .* raw,1);
end

