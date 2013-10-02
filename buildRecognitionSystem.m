% Benjamin Shih
% 10/1/13
% 2.4 Building a Model of the Visual World
% Returns the histogram intersection similarity between wordHist and each
% training sample as a 1xT vector.

% Input:
% 

% Output: 

tic

% Generate my filter bank.
filterBank = createFilterBank();

% Load my visual word dictionary.
load('dictionary.mat');

%%
% Create the matrix containing all of the histograms of the N training
% images in the data set.
% Close the pools, if any

% numCores = 2;
% 
% try
%     fprintf('Closing any pools...\n');
%     matlabpool close; 
% catch ME
%     disp(ME.message);
% end
% 
% fprintf('Starting a pool of workers with %d cores\n', numCores);
% matlabpool('local',numCores);
% 
%load the files and texton dictionary
load('traintest.mat','imTrs','csTrs','mapping');
load('dictionary.mat','filterBank','dictionary');
% 
% source = 'wordmaps/'; 
% 
% if ~exist(target,'dir')
%     mkdir(target);
% end
% 
% for cate = mapping
%     if ~exist([target,cate{1}],'dir')
%         mkdir([target,cate{1}]);
%     end
% end
% % 
% % %This is a peculiarity of loading inside of a function with parfor. We need to 
% % %tell MATLAB that these variables exist and should be passed to worker pools.
% % filterBank = filterBank;
% % dictionary = dictionary;
% layerNum = 3;
% dictionarySize = length(dictionary);
% 
% %matlab can't save/load inside parfor; accumulate
% %them and then do batch save
% len = length(imTrs);
% 
% featureTrs = zeros(dictionarySize*(4^(layerNum)-1)/3, len);
% parfor i=1:len
%     fprintf('Generating histogram for training image %s\n', imTrs{i});
%     load([source, strrep(imTrs{i}, '.jpg', '.mat')]);
%     featureTrs(:, i) = getImageFeaturesSPM(layerNum, wordMap, dictionarySize);
% end
% 
% %close the pool
% fprintf('Closing the pool\n');
% matlabpool close

layerNum = 3;
dictionarySize = length(dictionary);

len = length(imTrs);
source = 'wordmaps/';

featureTrs = zeros(dictionarySize*(4^(layerNum)-1)/3, len);
for i=1:len
    fprintf('Generating histogram for training image %s\n', imTrs{i});
    load([source, strrep(imTrs{i}, '.jpg', '.mat')]);
    featureTrs(:, i) = getImageFeaturesSPM(layerNum, wordMap, dictionarySize);
end

%%
% Load the vector containing the labels of each of the images.
classTrs = csTrs';

%%


toc


