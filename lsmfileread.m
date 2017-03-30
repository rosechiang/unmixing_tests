function [data,j]=lsmfileread(filename)
% This function reads lambda scans over time LSM files saved with Zen 2009.
% For some reason they only know, LSM file is structured as a sequence of
% TIFF files. Here's an example:
% -You acquire 10 frames 256x256 with 32 channels
% -The saved file will contain 20 frames:
% The order is as follows:
% -Position 1: is frame 1, when you imread it you obtain a 256x256x32
% matrix
% -Position 2: is an RGB bin 2 image of frame 1, 128x128x3, if you want use
% it otherwise just skip to position 3.
% -Position 3: frame 2
% -Position 4: RGB bin 2 image of frame 2
% -etc..
 
% In conclusion if you read position 1,3,5,7 etc you read a 32 channel TIF
% file. Easier than expected.
 
if iscell(filename)
    N = length(filename);
    j=1;
    for i=1:N
        info = imfinfo(filename{i});
        num_images = numel(info);
        fprintf('Reading file %d of %d\n',i,N);
        for k=1:2:num_images
            data(j,:,:,:)=double(imread(filename{i},k));
            j=j+1;
        end
    end
 
else
     
    %N = length(filename);
    j=1;
    %for i=1:N
        info = imfinfo(filename);
        num_images = numel(info);
        fprintf('Reading one file\n');
      for k=1:2:num_images
            data(j,:,:,:)=double(imread(filename,k));
           j=j+1;
        end
    %end
end
    j=j-1;
    
