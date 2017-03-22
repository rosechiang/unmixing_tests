clear; 

startfit = 1;
endfit = 100; %number of channels
nindvars = 5; %number of spectrum
noiseamp = 0;
X_val = startfit:1:endfit;
store_noiserate = [];
store_amp = [];
store_time = [];
error = [];
avgse = [];

dataspectra = zeros(100,100,endfit); % store the sum_plot in each i,j
datasnoise = zeros(100,100,endfit);  % store sum_plot add noise
datasnoisetemp = zeros(100,100,endfit);
datarates = zeros(100,100,nindvars);
% dataratefound = zeros(100,100,nindvars);
% dataratefoundnoise = zeros(100,100,nindvars);


% [indvars, sum_plot, rates, nindvars] = generatespectram(startfit, endfit);
for i = 1:100
    for j = 1:100
        [indvars, sum_plot, rates] = generatespectram(startfit, endfit, nindvars);
        dataspectra(i,j,:) = sum_plot;
        datarates(i,j,:) = rates; 
        datasnoise(i,j,:) = generate_noise(sum_plot);
    end
end

[coef, timewonoise] = fitcubedata(nindvars, startfit, endfit, indvars, dataspectra);
% dataratefound = coef;
store_time = [timewonoise];
store_amp = [0];

for k = 1:5
        addnoise = cubenoise(datasnoise);
        [temp,time] = fitcubedata (nindvars, startfit, endfit, indvars,addnoise);  
        dataratefoundnoise = temp;
        noiseamp = noiseamp +1; 
        store_amp = [store_amp noiseamp];
        store_time = [store_time time];
        datasnoise = addnoise;
        error = [error cubeerror(coef,temp)];
                
        
end 
    
goodnessOfFit(squeeze(coef(1,1,:)),squeeze(dataratefoundnoise(1,1,:)),'MSE')

% datasnoise2 = zeros(100,100,endfit);
% datasnoise3 = zeros(100,100,endfit);
% datasnoise4 = zeros(100,100,endfit);
% dataratefound2 = zeros(100,100,nindvars);
% dataratefound3 = zeros(100,100,nindvars);
% dataratefound4 = zeros(100,100,nindvars);
 % datasnoise1(i,j,:) = generate_noise(sum_plot);
    % datasnoise2(i,j,:) = generate_noise(datasnoise1(i,j,:));
    % datasnoise3(i,j,:) = generate_noise(datasnoise2(i,j,:));
    % datasnoise4(i,j,:) = generate_noise(datasnoise3(i,j,:));
    % dataratefound1(i,j,:) = fitdata(nindvars, startfit, endfit, indvars, datasnoise1(i,j,:));
    % dataratefound2(i,j,:) = fitdata(nindvars, startfit, endfit, indvars, datasnoise2(i,j,:));
    % dataratefound3(i,j,:) = fitdata(nindvars, startfit, endfit, indvars, datasnoise3(i,j,:));
    % dataratefound4(i,j,:) = fitdata(nindvars, startfit, endfit, indvars, datasnoise4(i,j,:));
   
% 
% 
% figure;
% hold on
% plot(X_val, indvars, '--', X_val, sum_plot,'DisplayName','spectrum')
% title('Spectra');xlabel('channels');ylabel('intensity');


% add noise with different amp and count the time period find best fit

% noise_sum_plot = generate_noise(sum_plot);
% [noise,time,jacobain] = fitdata(nindvars, startfit, endfit, indvars, noise_sum_plot);
% se = geterror(nindvars, startfit, endfit, noise, noise_sum_plot,indvars, jacobain);
% shotnoise = sqrt(noise_sum_plot)./store_amp

% plot(noise_sum_plot,'DisplayName','noise')
% temp_avgse = sum(se)/nindvars;
% 
% store_noiserate = [store_noiserate noise];
% store_time = [store_time time];
% store_amp = [store_amp amp];
% avgse = [avgse; temp_avgse];


% legend('show');
%            
figure(2)
hold on
plot(store_amp, store_time)
title('running period');xlabel('noise amp');ylabel('time(ms)');
% 
% figure(3)
% hold on
% plot(avgse)
% title('error in different noise');xlabel('noise amp');ylabel('average stand error');