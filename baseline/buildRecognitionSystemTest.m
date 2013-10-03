%% Training Data evaluation - run this separately using ctrl enter on windows

load('traintest.mat','imTss');

len = length(ibaselinemTss);

for i=1:len
    close all;
    clc;
    impath=imTss{i};
    img = imread(['images/', impath]);
    imshow(img);
    guessImage(['images/', impath]);
    pause
end