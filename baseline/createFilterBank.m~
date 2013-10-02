function [filterBank] = createFilterBank()
% Xinlei Chen
% CV Fall 2013 - Provided Code
% Code to get a reasonable filter bank

%3 scales
scales = 1:3;

%Some arbitrary bandwidths
gaussianSigmas = [1, 2, 4];
logSigmas = [1, 2, 4, 8];
dGaussianSigmas = [2, 4];
averageSigmas = [1, 2, 4];
prewittSigma = [1, 0]; % Filler for contributing to filterBank size. One horizontal, one vertical.
sobelSigma = [1, 0]; % Filler for contributing to filterBank size. One horizontal, one vertical.


% Preallocate the filterBank.
filterBank = cell(length(scales) * (length(prewittSigma) + length(sobelSigma) + length(averageSigmas) + length(gaussianSigmas) + length(logSigmas) + length(dGaussianSigmas)), 1);

ind = 1;
for scale=scales
    scaleMultiply = sqrt(2)^scale;
    %Gaussians
    for s=gaussianSigmas
        filterBank{ind} = getGaussianFilter(s*scaleMultiply);
        ind = ind + 1;
    end
    %LoG
    for s=logSigmas
        filterBank{ind} = getLOGFilter(s*scaleMultiply);
        ind = ind + 1;
    end
    %d/dx, d/dy Gaussians
    for s=dGaussianSigmas
        filterBank{ind} = filterDerivativeX(getGaussianFilter(s*scaleMultiply));
        ind = ind + 1;
        filterBank{ind} = filterDerivativeY(getGaussianFilter(s*scaleMultiply));
        ind = ind + 1;
    end
    
    % BenShih - Additional Filters
    % Averaging Filter
    for s=averageSigmas
        filterBank{ind} = getAverageFilter(s*scaleMultiply);
        ind = ind + 1;
    end
    
    % Prewitt Edge-Emphasizing Filter
    for s = prewittSigma
        filterBank{ind} = getPrewittFilter();
        if 0 == s
           filterBank{ind} = filterBank{ind}'; 
        end
        ind = ind+1;
    end
    
    % Sobel Edge-Emphasizing Filter
    for s = sobelSigma
        filterBank{ind} = getSobelFilter();
        if 0 == s
            filterBank{ind} = filterBank{ind}';
        end
        ind = ind+1;
    end
end

end

function h = getGaussianFilter(sigma)
    h = fspecial('gaussian',ceil(sigma*3*2+1),sigma);
end

function h = getLOGFilter(sigma)
    h = fspecial('log',ceil(sigma*3*2+1),sigma);
end

function hD = filterDerivativeX(h)
    ddx = [-1, 0, 1];
    hD = imfilter(h, ddx); 
end

function hD = filterDerivativeY(h)
    ddy = [-1, 0, 1]';
    hD = imfilter(h, ddy);
end


%% Ben's Filter Bank Additions

% Averaging filter
function h = getAverageFilter(sigma)
    h = fspecial('average',ceil(sigma*3*2+1));
end

% Prewitt Edge-Emphasizing Filter
function h = getPrewittFilter()
    h = fspecial('prewitt');
end

% Sobel Edge-Emphasizing Filter
function h = getSobelFilter()
    h = fspecial('sobel');
end


