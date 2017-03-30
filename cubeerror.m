function [avgerror,errordata] = cubeerror(coef, noise)

getxy = size(coef);
errordata = zeros(getxy(1),getxy(2));
        for i = 1:getxy(1)
            for j = 1:getxy(2)
               errordata(i,j) = mean(abs(coef(i,j,:) - noise(i,j,:))./coef(i,j,:));
            end
        end
        
        if isnan(errordata) > 0
        errordata(isnan(errordata))=[];
        avgerror = mean(errordata);
        else
        avgerror = mean(mean(errordata));
        end
        
end