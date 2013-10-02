% Benjamin Shih
% 9/29/13
% 2.2 Multi-resolution: Spatial Pyramid Matching
% Form a multi-resolution representation of a given image. 

% Input:
% layerNum is the number of layers in the spatial pyramid (i.e. L+1)
% wordMap is a HxW image containing the IDs of the visual words
% dictionarySize is the maximum visual word ID (i.e. number of visual
% words).

% Output: 

function [ h ] = getImageFeaturesSPM( layerNum, wordMap, dictionarySize )

    % Find the dimensions of the resulting vector.
    h = zeros(dictionarySize*(4^(layerNum)-1)/3, 1);
    % Find the maximum layer number. Starts at 0. 
    L = layerNum - 1;

    % Find the number of rows/cols in the smallest layer. 
    smallestLayer = 2^L;
    mapDim = size(wordMap);

    % Take the floor of the cell division. We will throw out the extra rows/cols of pixels
    rowSmall = floor(mapDim(1)/smallestLayer);
    colSmall = floor(mapDim(2)/smallestLayer);
    
    % Calculate the histograms for the finest layer.
    for i = 1:2^L
        for j = 1:2^L
            cellMap = wordMap((i-1)*rowSmall + 1:i*rowSmall, (j-1)*colSmall + 1:j*colSmall);
            cellNum = (i-1)*2^L + j;
            h((cellNum-1)*dictionarySize + 1:cellNum*dictionarySize, 1) = getImageFeatures(cellMap, dictionarySize) .* 0.5;
        end
    end
    
    % Temporarily assume that layerNum is always 3. Can simply renormalize
    % because all cells have the same number of pixels and thus the weights
    % are the same. 
    h(1601:1700) = (h(1:100) + h(101:200) + h(401:500) + h(501:600)) .* 0.25;
    h(1701:1800) = (h(201:300) + h(301:400) + h(601:700) + h(701:800)) .* 0.25;
    h(1801:1900) = (h(801:900) + h(901:1000) + h(1201:1300) + h(1301:1400)) .* 0.25;
    h(1901:2000) = (h(1001:1100) + h(1101:1200) + h(1401:1500) + h(1501:1600)) .* 0.25;
    
    h(2001:2100) = (h(1601:1700) + h(1701:1800) + h(1801:1900) + h(1901:2000)) .* 0.25;
    
    h = h / norm(h, 1);

%     weight = 
%     unweightedHist = 

end

% function [ h ] = getImageFeaturesSPM( layerNum, wordMap, dictionarySize )
% 
%     % Find the dimensions of the resulting vector.
%     hUnweight = cell((4^(layerNum)-1)/3, 1);
%     % Find the maximum layer number. Starts at 0. 
%     L = layerNum - 1;
% 
%     % Find the number of rows/cols in the smallest layer. 
%     smallestLayer = 2^L;
%     mapDim = size(wordMap);
% 
%     % Take the floor of the cell division. We will throw out the extra rows/cols of pixels
%     rowSmall = floor(mapDim(1)/smallestLayer);
%     colSmall = floor(mapDim(2)/smallestLayer);
%     
%     % Calculate the histograms for the finest layer.
%     for i = 1:2^L
%         for j = 1:2^L
%             cellMap = wordMap((i-1)*rowSmall + 1:i*rowSmall, (j-1)*colSmall + 1:j*colSmall);
%             hUnweight{(i-1)*2^L + j} = getImageFeatures(cellMap, dictionarySize) .* 0.5;
%         end
%     end
%     
%     % Temporarily assume that layerNum is always 3. Can simply renormalize
%     % because all cells have the same number of pixels and thus the weights
%     % are the same. 
%     hUnweight{17} = (hUnweight{1} + hUnweight{2} + hUnweight{5} + hUnweight{6}) .* 0.25;
%     hUnweight{18} = (hUnweight{3} + hUnweight{4} + hUnweight{7} + hUnweight{8}) .* 0.25;
%     hUnweight{19} = (hUnweight{9} + hUnweight{10} + hUnweight{13} + hUnweight{14}) .* 0.25;
%     hUnweight{20} = (hUnweight{11} + hUnweight{12} + hUnweight{15} + hUnweight{16}) .* 0.25;
%     
%     hUnweight{21} = (hUnweight{17} + hUnweight{18} + hUnweight{19} + hUnweight{20}) .* 0.25;
%     
%     
%     
%     % Return h as a vector.
%     h = zeros(dictionarySize*(4^(layerNum)-1)/3, 1);
%     for i = 1:length(hUnweight)
%         h((i-1)*dictionarySize + 1:i*dictionarySize, 1) = hUnweight{i};
%     end
% %     weight = 
% %     unweightedHist = 
% 
% end


% matlab's impyramid
% http://prism2.mem.drexel.edu/~rares/pyramidRepresentation.htm

% MATLAB function: impyramid()
% Only Gaussian pyramid
% ‘reduce’ or ‘expand’ modes
% MATLAB function: imresize()
% Useful for masks resizing
