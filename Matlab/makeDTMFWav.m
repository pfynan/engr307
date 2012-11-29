function x = makeDTMFWav(length,varargin)
Fs = 8000;
Ts = 1/Fs;
t = 0:Ts:.045;
p = 0*t;
x = 0;
for R = 1:(nargin-1)
y = sineCreate(varargin{R},length);

if (x == 0)
    x =  horzcat(y);
else
    x = horzcat(x,p,y);
end
end
%sound(x);
%plot(x);
end



function x = sineCreate(DTMF,length)
Fs = 8000;
Ts = 1 / Fs;
t = 0:Ts:length;

if (DTMF == 0)
f1 = 941;
f2 = 1336;
    
elseif (DTMF == 1)
f1 = 697;
f2 = 1209;
    
elseif (DTMF == 2)
f1 = 697;
f2 = 1336;
    
elseif (DTMF == 3)
f1 = 697;
f2 = 1477;

elseif (DTMF == 4)
f1 = 770;
f2 = 1209;

elseif (DTMF == 5)
f1 = 770;
f2 = 1336;

elseif (DTMF == 6)
f1 = 770;
f2 = 1477;

elseif (DTMF == 7)
f1 = 852;
f2 = 1209;

elseif (DTMF == 8)
f1 = 852;
f2 = 1336;     

elseif (DTMF == 9)
f1 = 852;
f2 = 1477;     

elseif (DTMF == '#')
f1 = 941;
f2 = 1477;

elseif (DTMF == '*')
f1 = 941;
f2 = 1209;

elseif (DTMF == 'd')
f1 = 350;
f2 = 440;     

elseif (DTMF == 'r')
f1 = 440;
f2 = 480;

elseif (DTMF == 'b')
f1 = 480;
f2 = 620;

elseif (DTMF == 'p')
    
else 
errordlg('Entry Not Valid')

end
x =sin(2*pi*t*f1) + sin(2*pi*t*f2);
end
