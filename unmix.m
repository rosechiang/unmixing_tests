clear; 

startfit = 1;
endfit = 100;
X_val = 1:startfit:endfit;
store_noiserate = [];
store_amp = [];
store_time = [];
shot_noise = [];
avgse = [];

%create the data matrix
datacube = cell(5);

% % % % check this part
% % % % not sure if i could use data structure or cell
% % % for i = 1:5
% % %     for j =1:5
% % %    [indvars, sum_plot, rates, nindvars] = generatespectram(startfit, endfit);
% % %    datacube(i,j) = {indvars, sum_plot, rates, nindvars};
% % % %    datacube(i,j) = {generatespectram(startfit, endfit)}; 
% % %     end
% % % end

[indvars, sum_plot, rates, nindvars] = generatespectram(startfit, endfit);
ratefound = fitdata(nindvars, startfit, endfit, indvars, sum_plot)

figure;
hold on
plot(X_val, indvars, '--', X_val, sum_plot,'DisplayName','spectrum')
title('Spectra');xlabel('channels');ylabel('intensity');


% add noise with different amp and count the time period find best fit
for amp = 120:-20:30
noise_sum_plot = generate_noise(sum_plot,amp);
[noise,time,jacobain] = fitdata(nindvars, startfit, endfit, indvars, noise_sum_plot);
se = geterror(nindvars, startfit, endfit, noise, noise_sum_plot,indvars, jacobain);
% shotnoise = sqrt(noise_sum_plot)./store_amp

plot(noise_sum_plot,'DisplayName','noise')
temp_avgse = sum(se)/nindvars;

store_noiserate = [store_noiserate noise];
store_time = [store_time time];
store_amp = [store_amp amp];
avgse = [avgse; temp_avgse];

end

legend('show');
%            
figure(2)
hold on
plot(store_time)
title('running period');xlabel('noise amp');ylabel('time(ms)');

figure(3)
hold on
plot(avgse)
title('error in different noise');xlabel('noise amp');ylabel('average stand error');
