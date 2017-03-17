
function [nindvars, npts, dindvar, startfit, endfit] = linleastsquares(indvars1, baseline, startfit1, endfit1)



% here we provide the component independent variable arrays
% this version can add a baseline array and allows for a fit range

npts = length(indvars1);  % number of channels
startfit = startfit1;
endfit = endfit1;

if baseline ~= 1
    nindvars = length(indvars1); 
    dindvars = indvars1;       
else
    nindvars = length(indvars1(:,1))+1; % number of spectra
    dindvars = [ones(1,npts);indvars1]

end
end
%% do we need baseline? what is the baseline for?

