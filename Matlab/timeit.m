ls = linspace(.04,5,20);
for i = 1:length(ls)
    x = makeDTMFWav(ls(i),1,2,3,4,5,6,7,8,9,0,'*','#','b','r','d');
    dis = chopDiscrete(x);
    tic
    y = cellfun(@decodeBP,dis);
    ts(i) = toc;
end

    