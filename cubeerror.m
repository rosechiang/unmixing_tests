function [error] = cubeerror(coef, noise)

getxy = size(coef);
temp = zeros(getxy);
        for i = 1:100
            for j = 1:100
               temp(i,j,:) = mean(abs(coef(i,j,:) - noise(i,j,:))./coef(i,j,:));
            end
        end
end