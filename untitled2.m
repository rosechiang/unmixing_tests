
filename_global = lsmfileread('sox10BAC_AviRangap_18s3_subset_Subsetestingt.lsm')

for aa=1: length(filename_global);
    info1= imfinfo(filename_global{aa});
    temp_matrix= zeros( info1(1).Width, info1(1).Height,length(info1));
    %read
    for i=1:length(info1)
        temp_matrix(:,:,i) = imread( filename_global{aa}, i);
    end
    %smooth n times
    for gg= 1: filecell_val.smooth_times
        temp_matrix= smooth3(temp_matrix,'gaussian');
    end
    %write back
    FileName1= filename_global{aa};
    filecell_val.filename=[ (FileName1(1,1:end-3)) '-Smoothed-' (num2str(filecell_val.smooth_times)) ' times-' (FileName1(1,end-3:end))];
    for i = 1: length(info1)
        imwrite(uint16(temp_matrix(:,:,i)), filecell_val.filename, 'writemode', 'append','compression','none');
    end
    disp('writing file');
end