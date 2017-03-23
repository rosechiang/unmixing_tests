function [error] = cubeerror(coef, noise)

getxy = size(coef);
error = zeros(getxy(1),getxy(2));
        for i = 1:getxy(1)
            for j = 1:getxy(2)
               error(i,j) = mean(abs(coef(i,j,:) - noise(i,j,:))./coef(i,j,:));
            end
        end
end