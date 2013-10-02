% Benjamin Shih
% 9/26/13
% 1.2 Creating Visual Words
% Map each pixel in the image to its closest word in the dictionary. 

% Input:
% Output: wordMap is a matrix with the same width and height as I. Each
% pixel in wordMap is assigned the closest visual word of the filter
% response at the respective pixel in I. 

function [ wordMap ] = getVisualWords( I, filterBank, dictionary )
    imgDim = size(I);

    % Obtain all of the filter responses for the given image. 
    % Input:
    % I is HxW
    % filterBank is 
    % Output: 
    % filterResponses is (H*W) x 99
    [filterResponses] = extractFilterResponses(I, filterBank);

    % Compute the distances between the filter responses (of the filter bank at
    % each pixel) and the dictionary of visual words. Find the minimum distance
    % (corresponding to the filter response that is "most similar") and
    % associate that filter response (otherwise called "visual word") with the
    % pixel.
    dist = pdist2(dictionary, filterResponses);
    similarity = min(dist); % dim: 1x(number of pixel in I)
    % Find the column (this number represents a visual word) that
    % corresponds to the min value in each row.
    simDim = length(similarity);
    idx = zeros(length(similarity), 1);
    for i = 1:simDim
        idx(i) = find(dist(:,i) == similarity(i));
    end
    wordMap = reshape(idx, imgDim(1:2));
    

end