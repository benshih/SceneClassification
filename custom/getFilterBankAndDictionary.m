% Benjamin Shih
% 9/26/13
% 1.1 Creating Visual Words
% Generate a dictionary given a list of images. 

function [ filterBank, dictionary ] = getFilterBankAndDictionary( imPaths )

% Number of visual words in dictionary: K is [100, 300].
K = 200;
% Number of strongest features to take.
alpha = 20;


% Load each file by iterating through the cell array of strings containing
% the full path to an image.
%imList = cell(length(imPaths), 1);
[filterBank] = createFilterBank();
alphaPixelImg = zeros(length(imPaths) * alpha, 1, 3);

for Ti = 1:length(imPaths)
    % Read and store the image.
    img = imread(imPaths{Ti});
    
    % Identify the SURF features, take the strongest alpha points. 
    imgDim = size(img);
    
    numPixel = numel(img(:,:,1));
    pixels = randperm(numPixel, alpha);
    
    points = detectSURFFeatures(img(:,:,1));
    strongestP = points.selectStrongest(alpha);
    pixelCoord = round(strongestP.Location)';
    if not(isempty(pixelCoord))
        pixels(1:length(pixelCoord)) = pixelCoord(2,:).*imgDim(2) + pixelCoord(1,:);
    end

    %Ti

    % Apply all of the filters to the alpha random pixels selected using
    % randperm. The alpha random pixels are selected in one color channel
    % of the image, then the corresponding pixels from all three of the RGB
    % channels are extracted and concatenated into one sub-image which
    % still has 3 RGB channels. Then, this new sub-image is passed into the
    % extractFilterResponses function.
    R = img(:,:,1);
    G = img(:,:,2); 
    B = img(:,:,3);
    RCol = R(:);
    GCol = G(:);
    BCol = B(:);
    RAlphaPixels = RCol(pixels);
    GAlphaPixels = GCol(pixels);
    BAlphaPixels = BCol(pixels);

    alphaPixelImg(1+alpha*(Ti-1):Ti*alpha, 1) = RAlphaPixels;
    alphaPixelImg(1+alpha*(Ti-1):Ti*alpha, 2) = GAlphaPixels;
    alphaPixelImg(1+alpha*(Ti-1):Ti*alpha, 3) = BAlphaPixels;
    
    
end

size(alphaPixelImg)

[filterResponses] = extractFilterResponses(alphaPixelImg, filterBank);
[unused, dictionary] = kmeans(filterResponses, K, 'EmptyAction', 'drop');


end

