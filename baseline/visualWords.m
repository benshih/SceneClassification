% Benjamin Shih
% 9/22/2013
% Section 1.0: Representing the World

[filterBank] = createFilterBank();
[filterResponses] = extractFilterResponses(img, filterBank);
img = imread('Q1-1_test.jpg');

% close all
% figure
% len = length(filterBank);
% for i=1:len
%     subplot(1,len, i);
%     currFilt = filterBank{i};
%     [filterResponses] = extractFilterResponses(img, currFilt);
%     imagesc(filterResponses);
% end



close all
figure
len = length(filterBank);
dim = size(img(:,:,1));
numDispRows = 3;
filterIms = cell(33,1);

for i=1:3:len*3
   R = reshape(filterResponses(:,i), dim);
   G = reshape(filterResponses(:,i+1), dim);
   B = reshape(filterResponses(:,i+2), dim);
   
   im = cat(3,R,G,B);
   filterIms{(i+2)/3} = im;
   subplot(numDispRows,len/numDispRows,(i+2)/3);
   imshow(im);
   %imagesc(im);
    
end

%%
for i=1:len
   close all
   figure
   subplot(1,3,1); imshow(filterIms{i});
   subplot(1,3,2); imagesc(filterBank{i});
   subplot(1,3,3); imshow(img);
   pause
end