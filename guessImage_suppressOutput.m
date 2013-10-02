function guessedImage = guessImage_suppressOutput( imageName, filterBank, dictionary, featureTrs, classTrs )
% Xinlei Chen
% CV Fall 2013 - Provided Code
% Given a path to a scene image, guess what scene it is
% Input:
%   imageName - path to the image


image = imread(imageName);
wordMap = getVisualWords(image, filterBank, dictionary);
h = getImageFeaturesSPM( 3, wordMap, size(dictionary,1));
distances = distanceToSet(h, featureTrs);
[~,nnI] = max(distances);
load('traintest.mat','mapping');
guessedImage = mapping{classTrs(nnI)};

end

