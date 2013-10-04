% Benjamin Shih
% 9/29/13
% 2.3 Comparing Images
% Returns the histogram intersection similarity between wordHist and each
% training sample as a 1xT vector.

function [ histInter ] = distanceToSet( wordHist, histograms)

% Find the histogram intersection similarity.
histInter = sum(bsxfun(@min, wordHist, histograms));


end

