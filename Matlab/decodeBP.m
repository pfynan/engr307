function DTMF = decodeBP( signal )
%DECODEBP Summary of this function goes here
%   Detailed explanation goes here

fr = [697 770 852 941];
fc = [1209 1336 1477];

pr = arrayfun(@(f)sigpower(f,signal),fr);
pc = arrayfun(@(f)sigpower(f,signal),fc);

lookup = [ '1' '2' '3';
           '4' '5' '6';
           '7' '8' '9';
           '*' '0' '#';];

[~, ridx] = max(pr);
[~, cidx] = max(pc);


DTMF = lookup(ridx,cidx);
end

function [ s ] = bp(freq,sig)
sr = 8000;
L = 20;
n = 50;
% note window
b = fir1(n,[2*(freq - L)/sr 2*(freq + L)/sr],triang(n+1));
s = filter(b,1,sig);

end

function P = sigpower(freq,signal)
s = bp(freq,signal);
P = sum(s.*s)/length(s);
end