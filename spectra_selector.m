clear all;
close all


mat = lsmfileread('sox10BAC_AviRangap_18s3_subset_Subset.lsm');
aa= squeeze(mat);

subplot_handle = subplot(2,1,1);
fig_handle = imagesc(mean(aa,3));


h=imrect();

position = getPosition(h);
position = round(position);
%plot_handle = figure; 
subplot(2,1,2);
h2 = plot(squeeze(mean(mean(aa(position(2):position(2)+position(4),position(1):position(1)+position(3), :)))));
var_handles.h2 = h2;
var_handles.aa = aa;
setappdata(0,'var_handles',var_handles);

addNewPositionCallback(h,@grab_new_spectra);






