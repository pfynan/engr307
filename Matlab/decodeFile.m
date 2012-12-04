function [ out ] = decodeFile(decoder , file )
%DECODEFILE Summary of this function goes here
%   Detailed explanation goes here

x = wavread(file);
out = decodeDTMFSignal(decoder,preprocess(x));

end

