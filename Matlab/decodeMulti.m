function [ out ] = decodeMulti( fun, sig )
%DECODEMULTI Summary of this function goes here
%   Detailed explanation goes here

decoders = {@decodeBP @goertzelDecode};
out = cellfun(@(f) elem(f,fun,sig),decoders);

end

function y = elem(f,fun,sig)

y.decoder = char(f);
y.result = fun(f,sig);
end
