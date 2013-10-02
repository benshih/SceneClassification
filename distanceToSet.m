% Benjamin Shih
% 9/29/13
% 2.3 Comparing Images
% Returns the histogram intersection similarity between wordHist and each
% training sample as a 1xT vector.

% Input:
% 

% Output: 

function [ histInter ] = distanceToSet( wordHist, histograms)

% histDim = size(histograms);
% T = histDim(2);
% histInter = zeros(1, T);

% % Naive implementation
% for i = 1:T
%     histInter(i) = sum(min(wordHist, histograms(:, i)));
% end


histInter = sum(bsxfun(@min, wordHist, histograms));


end

