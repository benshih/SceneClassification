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
%histInter = -sum(chi2pdf(repmat(wordHist, 1, histogramDim(2)), histograms));
%histInter = -sum((repmat(wordHist,1,histogramDim(2))-histograms).^2 ./ (repmat(wordHist,1,histogramDim(2)) + histograms))/2;
% % confusion matrix:
% %     20     0     0     0     0     0     0     0
% %     20     0     0     0     0     0     0     0
% %     20     0     0     0     0     0     0     0
% %     20     0     0     0     0     0     0     0
% %     20     0     0     0     0     0     0     0
% %     20     0     0     0     0     0     0     0
% %     20     0     0     0     0     0     0     0
% %     20     0     0     0     0     0     0     0
% % 
% % accuracy = 0.125
% % Elapsed time is 860.394593 seconds.


% L1 distance - Euclidean
histInter = -max(abs(repmat(wordHist, 1, histogramDim(2))-histograms));
% % confusion matrix:
% %      4     3     0     0     7     1     2     3
% %      0    13     1     3     1     1     1     0
% %      0     3    11     0     1     0     3     2
% %      0     6     5     5     0     2     1     1
% %      4     1     0     2    10     0     2     1
% %      0     5     4     4     1     5     0     1
% %      1     3     1     2     3     2     5     3
% %      2     0     1     2     8     1     3     3
% % 
% % accuracy = 0.35
% % Elapsed time is 850.780331 seconds.

% euclidean using pdist
%histInter = -pdist2(wordHist', histograms', 'hamming');
% % confusion matrix:
% %      2     0     0     0     2     0     0    16
% %      4     0     0     0     8     0     0     8
% %      7     0     0     0     9     0     0     4
% %     10     0     0     0     5     0     0     5
% %      2     0     0     0     3     0     0    15
% %      1     0     0     0    12     0     0     7
% %      2     0     0     0    11     0     0     7
% %      0     0     0     0     0     0     0    20
% % 
% % accuracy = 0.15625
% % Elapsed time is 893.446981 seconds.

end

