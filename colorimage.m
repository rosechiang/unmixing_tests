    
mat = lsmfileread('sox10BAC_AviRangap_18s3_subset_Subset.lsm');

mat2= squeeze(mat);
% test = mean(mat2,3);
% imagesc(test)

% for i = 1:32
%     figure(i)
%     imagesc(mat2(:,:,i));
% end
% 
% one = mat2(:,:,6);
% two = mat2(:,:,10);
% three = mat2(:,:,18);
% colorimg = zeros(947,1050,3);
% 
% 
% colorimg(:,:,1) = one;
% colorimg(:,:,2) = two;
% colorimg(:,:,3) = three;
% figure(2)
% imagesc(colorimg)

G = squeeze(mat2(357,966,:));
R = squeeze(mat2(245,686,:));
B = squeeze(mat2(167,758,:));

nindvars = 3;
startfit = 1; 
endfit = 32;
indvars = [G';R';B'];


[coef, timewonoise] = cubedatafit(nindvars, startfit, endfit, indvars, mat2);

unmix1 = sum(mat2,3).*coef(:,:,1);
unmix2 = sum(mat2,3).*coef(:,:,2);
unmix3 = sum(mat2,3).*coef(:,:,3);
figure;imagesc(unmix1)
figure;imagesc(unmix2)
figure;imagesc(unmix3)