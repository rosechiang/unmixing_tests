
clear; 

R = [-16:.1:16];
G = [-6:.1:32-6];
B = [-30:.1:2];

X_val = 1:1:100;

normr = normpdf(X_val,10,10);
normg = normpdf(X_val,50,10);
normb = normpdf(X_val,75,10);
rates = [];
store_noiserate = [];
store_amp = [];
store_time = [];
shot_noise = [];
avgse = [];

rate_generate = rand(1,2);
while sum(rate_generate) > 1
    rate_generate = rand(1,2);
end
    rates = [rate_generate, 1-sum(rate_generate)]

indvars = [normr; normg; normb];            %individual spectrum
sum_plot = rates*indvars;
rate = fitdata(1, 100,indvars, sum_plot)

figure;
hold on
plot(X_val,normr,'--',X_val,normg,'--',X_val,normb,'--',X_val, sum_plot,'DisplayName','spectrum')
title('Spectra');xlabel('channels');ylabel('intensity');
%plot(X_val, normr,'--', 'DisplayName', 'R', X_val,normg,'--', 'DisplayName', 'G',X_val,normb,'--', 'DisplayName', 'B', X_val, sum_plot,'DisplayName','combination')

for amp = 120:-20:30
noise_sum_plot = generate_noise(sum_plot,amp);
[noise,time,jacobain] = fitdata(1, 100,indvars, noise_sum_plot);
store_noiserate = [store_noiserate noise];
store_time = [store_time time];
store_amp = [store_amp amp];
% shotnoise = sqrt(noise_sum_plot)./store_amp
plot(noise_sum_plot,'DisplayName','noise')

se = geterror(noise, noise_sum_plot,indvars, jacobain);
temp_avgse = sum(se)/length(indvars(:,1));
avgse = [avgse; temp_avgse]
% legend(amp)
% title(lgd,'noise')
end

legend('show');
%            
figure
plot(store_time)
title('running period');xlabel('noise amp');ylabel('time(ms)');

figure
plot(avgse)
title('error in different noise');xlabel('noise amp');ylabel('average stand error');


% temp = normr + normg + normb;
% linspace(-30,0.1,26)
% plot(x ,temp) 
% temp = conv(normr,normg)



%oise_sum_plot = imnoise(sum_plot, 'poisson');
%noise_sum_plot = sum_plot+0.003*rand(1,length(sum_plot));


% sum_plot = R1.*normr+R2.*normg+R3.*normb;   %the combination spectra
% sum_plot = normr+normg+normb;

% idx = [-30: 0.1: 26]
% vec = zeros(size(idx))
% R_start = -16; R_end = 16;
% G_start = -6; G_end = 26;
% B_start = -30; B_end = 2;s
% vec(find(idx==R_start): find(idx==R_end)) = normr;
% vec(find(idx==G_start): find(idx==G_end)) = normg;
% vec(find(idx==B_start): find(idx==B_end)) = normb;