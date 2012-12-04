path = 'S:\Engineering\Library\Engr307\Sound Files\';
list = dir(fullfile(path,'*.wav'));
files = {list(:).name};
files = cellfun(@(x) fullfile(path,x), files,'UniformOutput',false);
res = cellfun(@(f) struct('file',f,'result', decodeMulti(@decodeFile,f)), files, 'UniformOutput',false);
res = [res{:}];
for i = 1:length(res)
    fprintf('File: %s\n',res(i).file);
    tmp = res(i).result;
    for j = 1:length(tmp)
        fprintf('\tDecoder: %s\n',tmp(j).decoder);
        fprintf('\tResult:  %s\n',tmp(j).result);
    end
end