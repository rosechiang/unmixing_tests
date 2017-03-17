%how to save the sum_plot to the data type we want (indvars1, nindvar=3,
%baseline, data)? startfit1=1, endfit1=100? 
clear; 

R = [-16:.1:16];
G = [-6:.1:32-6];
B = [-30:.1:2];

X_val = 1:1:100;


normr = normpdf(X_val,10,10);
normg = normpdf(X_val,50,10);
normb = normpdf(X_val,75,10);
rates = zeros(1,3);

rate_generate = rand(1,2);
while sum(rate_generate) > 1
    rate_generate = rand(1,2);
end
    rates = [rate_generate, 1-sum(rate_generate)]

indvars = [normr; normg; normb];            %individual spectrum
sum_plo t = rates*indvars;

for i = 1:100
    r = rand(1);
    if r > 0.6
        a = - 1;
    elseif r < 0.3
        a = 0;
    else
        a = 1;
    end
    
noise_sum_plot(i) = sum_plot(i)+a*sqrt(sum_plot(i))/60;
end

%oise_sum_plot = imnoise(sum_plot, 'poisson');
%noise_sum_plot = sum_plot+0.003*rand(1,length(sum_plot));


% sum_plot = R1.*normr+R2.*normg+R3.*normb;   %the combination spectra
% sum_plot = normr+normg+normb;

figure;

hold on
plot(normr)
plot(normg)
plot(normb)

plot(sum_plot)
plot(noise_sum_plot)
%            

rate = fitdata(1, 100,indvars, sum_plot)
noise_rate = fitdata(1, 100,indvars, noise_sum_plot)
% temp = normr + normg + normb;
% linspace(-30,0.1,26)
% plot(x ,temp) 
% temp = conv(normr,normg)

% idx = [-30: 0.1: 26]
% vec = zeros(size(idx))
% R_start = -16; R_end = 16;
% G_start = -6; G_end = 26;
% B_start = -30; B_end = 2;s
% vec(find(idx==R_start): find(idx==R_end)) = normr;
% vec(find(idx==G_start): find(idx==G_end)) = normg;
% vec(find(idx==B_start): find(idx==B_end)) = normb;