% Benjamin Shih
% 9/26/13
% 1.1 Creating Visual Words


[filterBank] = createFilterBank();
[filterResponses] = extractFilterResponses(img, filterBank);
img = imread('Q1-1_test.jpg');

% Generate a random permutation of the pixels to select for their
% responses.
imgDim = size(img);
numPixel = imgDim(1)*imgDim(2);
pixels = randperm(numPixel, alpha);

% Apply all of the filters to the alpha random pixels selected using
% randperm. 
imgAsRow = img(:);
alphaPixels = imgAsRow(pixels);


%[unused, dictionary] = kmeans(filterResponses, K, 'EmptyAction', 'drop');

