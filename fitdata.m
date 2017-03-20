

function [outcoef,running_time,jacobian] = fitdata (startfit, endfit, indvars, data)

nindvars = length(indvars(:,1));
jacobian=zeros(nindvars);
jvector=zeros(nindvars,1);
tic;
			for i = 1:1:nindvars
				for j = 1:1:i
					for k = startfit:1:endfit
                        jacobian(i,j) =  jacobian(i,j) + indvars(i,k)*indvars(j,k);
                    end
					if j~=i
						jacobian(j,i) = jacobian(i,j);
                    end
                end
        
				for k = startfit:1:endfit
						jvector(i) = jvector(i) + data(k)*indvars(i,k);
                end	 
            end
		outcoef = jacobian\jvector;
        running_time = toc;
end


% npts = length(indvars);  % number of channels

% ignore the baseline problem just add it directly 
%     nindvars = length(indvars1(:,1))+1; % number of spectra
%     dindvars = zeros(nindvars,npts);
%     dindvars = [ones(1,npts);indvars1]


% 						if weights ~= 0
% 							jacobian(i,j) = indvars(i,k)*indvars(j,k)*weights(k);
%                         else
% 							jacobian(i,j) = indvars(i,k)*indvars(j,k)*weights(k);
%                         end

%
       % public double[] fitdata(float[] data,float[] weights) 
       % how do i know the data how to transform 
       % is startfit and endfit same to number of channels? -> yes