% Benjamin Shih
% 9/29/13
% 2.3 Comparing Images
% Returns the distance between wordHist and each histogram as a 1xT vector.


function [ histInter ] = distanceToSet( wordHist, histograms)

histogramDim = size(histograms);

% L1 distance - Euclidean
histInter = -max(abs(repmat(wordHist, 1, histogramDim(2))-histograms));

end

