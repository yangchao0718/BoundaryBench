% Examples of benchmarks for different input formats
 addpath benchmarks
clear all;close all;clc;
% %init 
% %addpath('.\edge detection');
global PATH;
global row;
global col;
global iids;
%add imnoise
%im = imnoise(im,'gaussian',0,0.001)%imnoise(im,'gaussian',m,v)
%im = imnoise(im,'localvar',V)
%im = imnoise(im,'localvar',image_intensity,var)
%im = imnoise(im,'poisson');
%im = imnoise(im,'salt & pepper',0.03);
%im = imnoise(im,'speckle',v)
% imwrite(im,'SrcImage/gaussian.bmp');

%% 0. process different edge dection methods's edge in different TH
imgDir = 'data/images';
iids = dir(fullfile(imgDir,'*.jpg'));
nthresh =80;

% for imgNum=1:numel(iids)
%     
% PATH=strcat(imgDir,'/',strcat(iids(imgNum).name(1:end-4),'.jpg'));
% im=imread(PATH);
% [row,col,alpha]=size(im)  %d1=raw d2=col d3=dim
% if alpha==3
%     im=rgb2gray(im);
% end
% fprintf('Processing the %dth image\n',imgNum);
% %im=(uint8(im));
% %im=awgn(im,15,'measured');%Add white Gaussian noise to signal
% 
% M=4;
% % generate a series th 
% y=linspace(1/(nthresh+1),1-1/(nthresh+1),nthresh);
% 
% method={'roberts';'sobel';'prewitt';'canny';'log'};
% imgID=1;
% 
% for k=1:M
% for i=1:nthresh
% fprintf('the %dֵth thresold: %d\n',i,y(i));
% BW = edge(im,method{k,1},y(i));
% %strcat(method(k),int2str(k));
% saveDir=strcat('data/DestImage/',method{k,1},'/',int2str(imgNum));
% %make a directory
% if i==1
% mkdir(saveDir);
% end
% 
% if i<10
%    imwrite(BW,strcat(saveDir,'/','0',num2str(i),'.png'));
% else
%   imwrite(BW,strcat(saveDir,'/',num2str(i),'.png'));
% end
% 
% end
% end
% end

%% 1. all the benchmarks for results stored in 'ucm2' format

% imgDir = 'data/images';
% gtDir = 'data/groundTruth';
% inDir = 'data/ucm2';
% outDir = 'data/test_1';
% mkdir(outDir);
% nthresh = 5;
% 
% tic;
% allBench(imgDir, gtDir, inDir, outDir, nthresh);
% toc;
% 
% plot_eval(outDir);

%% 2. boundary benchmark for results stored as contour images
gtDir = 'data/groundTruth';
pbDir = 'data/DestImage';
outDir = 'data/test_2';
mkdir(outDir);
% system(sprintf('rm -f %s/*_ev1.txt',outDir));

tic;
boundaryBench(imgDir, gtDir, pbDir, outDir, nthresh);
toc;
plot_eval(outDir);
%% 3. boundary benchmark for results stored as a cell of segmentations

% imgDir = 'data/images';
% gtDir = 'data/groundTruth';
% pbDir = 'data/segs';
% outDir = 'data/test_3';
% mkdir(outDir);
% 
% nthresh = 99; % note: the code changes this to the actual number of segmentations
% tic;
% boundaryBench(imgDir, gtDir, pbDir, outDir, nthresh);
% toc;


%% 4. all the benchmarks for results stored as a cell of segmentations

% imgDir = 'data/images';
% gtDir = 'data/groundTruth';
% inDir = 'data/segs';
% outDir = 'data/test_4';
% mkdir(outDir);
% nthresh = 5;
% 
% tic;
% allBench(imgDir, gtDir, inDir, outDir, nthresh);
% toc;


%% region benchmarks for results stored as a cell of segmentations

% imgDir = 'data/images';
% gtDir = 'data/groundTruth';
% inDir = 'data/segs';
% outDir = 'data/test_5';
% mkdir(outDir);
% nthresh = 5;
% 
% tic;
% regionBench(imgDir, gtDir, inDir, outDir, nthresh);
% toc;
% 
