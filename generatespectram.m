
R = [-16:.1:16];
G = [-6:.1:32-6];
B = [-30:.1:2];

X_val = 1:1:100;


normr = normpdf(X_val,10,10);
normg = normpdf(X_val,50,10);
normb = normpdf(X_val,75,10);
R1 = .60;
R2 = .20;
R3 = .20;
sum_plot = R1.*normr+R2.*normg+R3.*normb;
% sum_plot = normr+normg+normb;

figure;
hold on
plot(normr)
plot(normg)
plot(normb)

plot(sum_plot)

% temp = normr + normg + normb;
% linspace(-30,0.1,26)
% plot(x ,temp) 
% temp = conv(normr,normg)

% idx = [-30: 0.1: 26]
% vec = zeros(size(idx))
% R_start = -16; R_end = 16;
% G_start = -6; G_end = 26;
% B_start = -30; B_end = 2;
% vec(find(idx==R_start): find(idx==R_end)) = normr;
% vec(find(idx==G_start): find(idx==G_end)) = normg;
% vec(find(idx==B_start): find(idx==B_end)) = normb;