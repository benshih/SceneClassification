% Benjamin Shih


[filterBank] = createFilterBank();
[filterResponses] = extractFilterResponses(img, filterBank);
img = imread('Q1-1_test.jpg');

% Map each pixel in the image to its closest word in the dictionary.
[wordMap] = getVisualWords(