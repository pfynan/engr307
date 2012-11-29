function DTMF = decodeBP( signal )
%DECODEBP Summary of this function goes here
%   Detailed explanation goes here

fr = [697 770 852 941 1209 1336 1477 620 480 440 350];

lookup = zeros(11,11);
lookup(fr==697,fr==1209) = '1';
lookup(fr==697,fr==1336) = '2';
lookup(fr==697,fr==1477) = '3';

lookup(fr==770,fr==1209) = '4';
lookup(fr==770,fr==1336) = '5';
lookup(fr==770,fr==1477) = '6';

lookup(fr==852,fr==1209) = '7';
lookup(fr==852,fr==1336) = '8';
lookup(fr==852,fr==1477) = '9';

lookup(fr==941,fr==1209) = '*';
lookup(fr==941,fr==1336) = '0';
lookup(fr==941,fr==1477) = '#';

lookup(fr==480,fr==620) = 'B';
lookup(fr==440,fr==480) = 'R';
lookup(fr==350,fr==440) = 'D';

lookup = char(lookup + lookup');

p = arrayfun(@(f)sigpower(f,signal),fr);

[~, idx] = sort(p,'descend');

DTMF = lookup(idx(1),idx(2));
end

function [ s ] = bp(freq,sig)
sr = 8000;
L = 20;
n = 128;
% note window
b = fir1(n,[2*(freq - L)/sr 2*(freq + L)/sr],rectwin(n+1));
s = filter(b,1,sig);

end

function P = sigpower(freq,signal)
s = bp(freq,signal);
P = sum(s.*s)/length(s);
end