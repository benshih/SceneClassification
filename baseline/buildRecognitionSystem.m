% Benjamin Shih
% 10/1/13
% 2.4 Building a Model of the Visual World
% Returns the histogram intersection similarity between wordHist and each
% training sample as a 1xT vector.


tic

% Generate my filter bank.
filterBank = createFilterBank();

% Load my visual word dictionary.
load('dictionary.mat');

% Generate the features for the training data.
load('traintest.mat','imTrs','csTrs','mapping');
load('dictionary.mat','filterBank','dictionary');

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

% Load the vector containing the labels of each of the images.
classTrs = csTrs';

% Save the .mat file. 
save('vision.mat', 'filterBank', 'dictionary', 'featureTrs', 'classTrs');

toc


