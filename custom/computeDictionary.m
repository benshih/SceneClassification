% Xinlei Chen
% CV Fall 2013 - Provided Code
% Does computation of the filter bank and dictionary, and saves
% it in dictionary.mat
%

tic

load('traintest.mat');
% give the absolute path
toProcess = strcat([cd,'/images/'],imTrs);
size(toProcess)
[filterBank,dictionary] = getFilterBankAndDictionary(toProcess);
save('dictionary.mat','filterBank','dictionary');
clear toProcess

toc