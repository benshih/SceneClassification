% Benjamin Shih
% 9/29/13
% 2.3 Comparing Images
% Returns the between wordHist and each histogram as a ___
% training sample as a 1xT vector.

% Input:
% 

% Output: 

function [ histInter ] = distanceToSet( wordHist, histograms)


% % histogram
% histInter = sum(bsxfun(@min, wordHist, histograms));

% chi2 distance
histogramDim = size(histograms);
%histInter = sum(chi2pdf(repmat(wordHist, 1, histogramDim(2)), histograms));
%histInter = sum((repmat(wordHist,1,histogramDim(2))-histograms).^2 ./ (repmat(wordHist,1,histogramDim(2)) + histograms))/2;

% L1 distance - Euclidean
%histInter = max(abs(repmat(wordHist, 1, histogramDim(2))-histograms));

% euclidean using pdist
histInter = pdist2(wordHist', histograms', 'hamming');

end

