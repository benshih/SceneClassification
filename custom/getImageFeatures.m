% Benjamin Shih
% 9/29/13
% 2.1 Extracting Features
% 

% Input: 
% wordMap is a H x W image containing the IDs of the visual words.
% dictionarySize is the maximum visual word ID (i.e. the number of visual
% words, the dictionary size). 

% Output: 
% h is a dictionarySize x 1 histogram that is L1 normalized. 

function [ h_norm ] = getImageFeatures( wordMap, dictionarySize )

% Compute the histogram of the IDs, binned based on the number of words in
% the dictionary.
h = hist(wordMap(:), 1:dictionarySize);

% Normalize the histogram to have a magnitude of 1.
h_norm = h / norm(h, 1);

h_norm = h_norm';

end

