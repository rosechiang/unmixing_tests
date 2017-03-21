function [indvars,sum_plot, rates, nindvars] = generatespectram(startfit, endfit)

indvars = [];
X_val = 1:startfit:endfit;

for i = 1:20:100
    temp = normpdf(X_val,i,10);
    indvars = [indvars; temp];
end

nindvars = length(indvars(:,1));
rates = rategenerate(nindvars); 
sum_plot = rates*indvars;

end


% temp = normr + normg + normb;
% linspace(-30,0.1,26)
% plot(x ,temp) 
% temp = conv(normr,normg)


%     
% norm1 = normpdf(X_val,10,10);
% norm2 = normpdf(X_val,50,10);
% norm3 = normpdf(X_val,75,10);
% norm4 = normpdf(X_val,100,10);
% norm5 = normpdf(X_val,20,10);
% indvars = [norm1; norm2; norm3; norm4; norm5];     
% indvars = [norm1; norm2; norm3; ];            %individual spectrum

% R = [-16:.1:16];
% G = [-6:.1:32-6];
% B = [-30:.1:2];

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