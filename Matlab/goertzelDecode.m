function x = goertzelDecode(subsgs)
f = [697 770 852 941 1209 1336 1477 350 440 480 620]; % tone frequencies
N = length(subsgs); % number of samples
Fs = 8000; %sampling frequency
freq_indices = round(f/Fs*N) + 1; %indices of the frequency
y = goertzel(subsgs, freq_indices); %returns the DFT of the input data using the goerztel algorithm
thres = 30;
if((abs(y(1)) > thres) && (abs(y(5)) > thres))
x ='1';

elseif((abs(y(1)) > thres) && (abs(y(6))> thres))
x = '2';

elseif((abs(y(1)) > thres) && (abs(y(7))> thres))
x = '3';

elseif((abs(y(2)) > thres) && (abs(y(5))> thres))
x = '4';

elseif((abs(y(2)) > thres) && (abs(y(6))> thres))
x = '5';

elseif((abs(y(2)) > thres) && (abs(y(7))> thres))
x = '6';

elseif((abs(y(3)) > thres) && (abs(y(5))> thres))
x = '7';

elseif((abs(y(3)) > thres) && (abs(y(6))> thres))
x = '8';

elseif((abs(y(3)) > thres) && (abs(y(7))> thres))
x = '9';

elseif((abs(y(4)) > thres) && (abs(y(5))> thres))
x = '*';

elseif((abs(y(4)) > thres) && (abs(y(6))> thres))
x = '0';

elseif((abs(y(4)) > thres) && (abs(y(7))> thres))
x = '#';

elseif((abs(y(8)) > thres) && (abs(y(9))> thres))
x = 'D';

elseif((abs(y(9)) > thres) && (abs(y(10))> thres))
x = 'R';

elseif((abs(y(10)) > thres) && (abs(y(11))> thres))
x = 'B';

else
x = char(0);
end

%stem(f, abs(y)) %just for reference

end