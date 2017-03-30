function [noiseplot] = generate_noise(sum_plot,endfit)
% add shot noise
    for i = 1:endfit
        r = rand(1);
        if r > 0.6
            ind = - 1;
        elseif r < 0.3
            ind = 0;
        else
            ind = 1;
        end
    noiseplot(i) = sum_plot(i)+ind*sqrt(sum_plot(i));
    end

end