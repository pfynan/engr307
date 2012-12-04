function [ dial ] = decodeDTMFSignal(decodefun, signal )
%DECODEDTMFSIGNAL Summary of this function goes here
%   Detailed explanation goes here

dial = unrep(cellfun(decodefun,chopDiscrete(signal)));
dial(dial == 0) = ' ';

end

function res = unrep(sig)
res = [0];
for n = 1:length(sig)
    if res(end) ~= sig(n)
        res = [res sig(n)];
    end
end
res = res(2:end);
end
        