function res = unrep(sig)
res = [0];
for n = 1:length(sig)
    if res(end) ~= sig(n) && sig(n) ~= 0
        res = [res sig(n)];
    end
end
res = res(2:end);
end
        
    