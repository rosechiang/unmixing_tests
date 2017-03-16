function [nindvars, npts, dindvar, startfit, endfit] = linleastsquares(indvars1, baseline, startfit1, endfit1)
% here we provide the component independent variable arrays
% this version can add a baseline array and allows for a fit range

npts = indvars1(0).length;  % number of channels
startfit = startfit1;
endfit = endfit1;

if baseline ~= 1
    nindvars = indvars1.length; % number of spectra
    dindvars = indvars1;        % spectra data
else
    nindvars = indvars1.length+1;
    dindvars = nindvars+1;
    dindvars(1,:) = npts;
    dindvars(1,:) = zeros(length(dinvars(1)));
    for i = 1:1:nindvars
        dindvars(i) = indvars1(i-1);
    end
end
end



