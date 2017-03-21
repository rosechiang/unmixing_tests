
function [rates] = rategenerate(num)
% rates = [];
rate_generate = rand(1,num-1);
while sum(rate_generate) > 1
    rate_generate = rand(1,num-1);
end
    rates = [rate_generate, 1-sum(rate_generate)];
end