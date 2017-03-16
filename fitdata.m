function [outcoef] = fitdata (nindvars, startfit, endfit)
		
		jacobian=zeros(nindvars);
		jvector=zeros(nindvars,1);
	
			for i = 1:1:nindvars
				for j = 1:1:i
					for k = startfit:1:endfit
						if weights ~= 0
							jacobian(i,j) = indvars(i,k)*indvars(j,k)*weights(k);
                        else
							jacobian(i,j) = indvars(i,k)*indvars(j,k)*weights(k);
                        end
                    end
					if j~=i
						jacobian(j,i)=jacobian(i,j);
                    end
                end
            end
            
		outcoef = jacobian\jvector;
end