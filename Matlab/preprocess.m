function [ y ] = preprocess( x )
%PREPROCESS Summary of this function goes here
%   Detailed explanation goes here

y = x / max(abs(x)) * 5;
end

