% Benjamin Shih
% 10/1/13
% 2.5 Quantitative Evaluation
% Compare my predictions to the test images and their corresponding labels.
% 

% Input:
% 

% Output: 

tic

load('traintest.mat','imTss', 'csTss', 'mapping');
load('vision.mat');

len = length(imTss);

C = zeros(length(mapping));
for k=1:len
    % i is actual class
    i = csTss(k);
    % j is predicted class
    guessClass = guessImage_suppressOutput(['../images/', imTss{k}], filterBank, dictionary, featureTrs, classTrs);
    classIndex = strfind(mapping, guessClass);
    j = find(not(cellfun('isempty', classIndex)));
    % Increase the count for the number of instances of class i that were
    % predicted as class j.
    C(i, j) = C(i,j) + 1;
end

acc = trace(C) / sum(C(:));

disp('confusion matrix:')
disp(C)
disp(['accuracy = ', num2str(acc)]);

toc