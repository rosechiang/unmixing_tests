function [coefcube,running_time] = fitcubedata (nindvars, startfit, endfit, indvars,cubedata)
tic;
getxy = size(cubedata);
coefcube = zeros(getxy(1),getxy(2),nindvars);
     for i = 1:getxy(1)
         for j = 1:getxy(2)     
             coefcube(i,j,:) = fitdata(nindvars, startfit, endfit, indvars, cubedata(i,j,:));
         end
     end
running_time = toc;
end

