function sgs = chopEnvelope(signal)
% 20th order lowpass filter
b = fir2(20, [0 0.05 0.1 1], [1 1 0 0]);
dsf = 3;
cutoff = 0.3;
envelope = abs(sqrt(filter(b,1,decimate(2*signal.*signal,dsf))));
idxs = [find(diff(envelope > cutoff))*dsf length(signal)];

ntones = floor(length(idxs)/2);
sgs = cell(ntones,1);

for n = 1:ntones
    sgs{n} = signal(idxs(2*n-1):idxs(2*n));
end
end