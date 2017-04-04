close all
clear

coefcube = [];
nindvars = 3;
startfit = 1;
endfit = 32;
load('indvars');
filenamee = 'sox10BAC_AviRangap_18s3_subset_Subsettesting.lsm'
mat = lsmfileread(filenamee);

for zp = 1:size(mat,1)
    mat2= squeeze(mat(zp,:,:,:));
    [coef, timewonoise] = cubedatafit(nindvars, startfit, endfit, indvars, mat2);
    
    for sp_ch = 1:nindvars
        unmix = sum(mat2,3).*coef(:,:,nindvars);
        %     coefcube(:,:,sp_ch) = unmix;
     
        for aa=1: length(filenamee)

            FileName1= filenamee(aa);
%             filecell_val.filename=[ (FileName1(1,1:end-3)) '-Smoothed-' (num2str(filecell_val.smooth_times)) ' times-' (FileName1(1,end-3:end))];            
            newname = [filenamee(1,1:end-4) '-z' num2str(zp) '-ch' num2str(sp_ch) '.tif'];
            imwrite(uint16(unmix),newname, 'compression','none');
        end
        
    end
    
end


% [aa,bb] = uiputfile('*.tif')
%
% aa =
%
% thisismyfile.tif
%
%
% bb =
%
% /Users/rose/scripts/unmixing_tests/
%
% aa(1,1:end-3)
%
% ans =
%
% thisismyfile.
%
% aa(1,1:end-4)
%
% ans =
%
% thisismyfile

% zp =1
% 
% zp =
% 
%      1
% 
% ch_num = 3 
% 
% ch_num =
% 
%      3
% 
% newname = [aa(1,1:end-4) '-z' num2str(zp) '-ch' num2str(ch_num) aa(1,end-4:end)]
