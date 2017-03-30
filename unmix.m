clear;
close all;
matsize = 10;
startfit = 1;
endfit = 100; %number of channels
nindvars = 5; %number of spectrum
noiseamp = 0;
run_time = 10;
noisenum = 5;

X_val = startfit:1:endfit;
store_amp = [];
store_time = [];
store_error = [0];
store_cell = cell(run_time, 3);
store_allerror = {};


dataspectra = zeros(matsize,matsize,endfit); % store the sum_plot in each i,j
% datasnoise = zeros(100,100,endfit);  % store sum_plot add noise
datarates = zeros(matsize,matsize,nindvars);

% weights = rand(nindvars,1); 
% %  weights = [1 1 1 1 1]';
% % weights = [1 1 1 1 0.6]';
% % weights = [1 1 1 1 0.3]';
weights = [1 1 1 1 0.1]';

for i = 1:matsize
    for j = 1:matsize
        [indvars, sum_plot, rates] = generatespectram(startfit, endfit, nindvars, weights);
        dataspectra(i,j,:) = sum_plot;
        datarates(i,j,:) = rates; 
    end
end

[coef, timewonoise] = cubedatafit(nindvars, startfit, endfit, indvars, dataspectra);

store_time = [timewonoise];
store_amp = [ noiseamp ];
% % 
figure(1);
hold on
plot(X_val, indvars, '--', X_val, squeeze(dataspectra(1,1,:)) ,'DisplayName','spectrum')
title('Spectra');xlabel('channels');ylabel('intensity');

datanoise = cubenoise(dataspectra,endfit);    
for run = 1:run_time

    for k = 1:noisenum

            [temp,time] = cubedatafit (nindvars, startfit, endfit, indvars,datanoise); 
    %       dataratefoundnoise = temp;
            noiseamp = noiseamp +1; 
            datanoise = cubenoise(datanoise,endfit);
            [avgerror, allerror] = cubeerror(coef,temp);
            
%             length_mat = size(allerror,1)*size(allerror,2)*run_time;
%             if run ==1 & k== 1:
%                 final_matrix_array = zeros( 5, size(allerror,1)*size(allerror,2)*run_time);
%             end
%             final_matrix_array(k, (length_mat*(run_time-1)+1):(length_mat*(run_time)+1)) = reshape(allerror());
            store_amp = [store_amp noiseamp];
            store_time = [store_time time];
            store_error = [store_error avgerror];
% %             for i = 1:noisenum
% %     figure(5)
% %     hold on
% % histogram(test(:,i),'FaceColor',cmap(i,:))
% % end
%             histogram(allerror,'FaceColor',cmap(noiseamp,:))
            figure(1);
            hold on
            plot(X_val, squeeze(datanoise(1,1,:)),'DisplayName','noise')
            store_allerror{k,run} = reshape(allerror,1,[]);  

    end
%             length_mat = zeros(noisenum,size(allerror,1)*size(allerror,2)*run_time);
    
  
store_cell{run,1} = store_time;
store_cell{run,2} = store_error;
store_cell{run,3} = store_amp;

store_time = [timewonoise];
store_amp = [noiseamp];
store_error = [0];
% noiseamp = 0;    
end    


    allerrormat = cell2mat(store_allerror);
    for i = 1:noisenum
    cmap = jet(noisenum+1);
    figure(4); hold on
    histogram(allerrormat(i,:),'FaceColor',cmap(i,:),'BinLimits',[0 1])
    end
% 
% for loop:for each row
%         histogram(final_matrix_array(row,:))
%     
test = cell2mat(store_cell);
plottime = sum(test(:,1:1+noisenum))/run_time;
ploterror = sum(test(:,1+noisenum+1:1+1+noisenum*2))/run_time;
plotamp = test (1,1+1+noisenum*2+1:end);
% 
% cmap = jet(noisenum+1);
% % 
% for i = 1:noisenum
%     figure(5)
%     hold on
% histogram(test(:,i),'FaceColor',cmap(i,:),'BinLimits',[0 1])
% end

% goodnessOfFit(squeeze(coef(1,1,:)),squeeze(dataratefoundnoise(1,1,:)),'MSE')

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

% % % 
% % % % legend('show');
%            
figure(2)
hold on
plot(plotamp, plottime)
title('running period in different noise');xlabel('noise amp');ylabel('time(ms)');

figure(3)
hold on
plot(plotamp, ploterror)
title('error in different noise');xlabel('noise amp');ylabel('average error');
