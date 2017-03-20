function [noiseplot] = generate_noise(sum_plot, amp)

% this function add shot noise

for i = 1:100
    r = rand(1);
    if r > 0.6
        a = - 1;
    elseif r < 0.3
        a = 0;
    else
        a = 1;
    end
    
noiseplot(i) = sum_plot(i)+a*sqrt(sum_plot(i))/amp;

end

end