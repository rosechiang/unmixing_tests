function [se] = geterror(nindvars, startfit, endfit, coef, data, indvars, jacobain)


    invm = []; 
    outcoef= [];
    tempc2 = 0;
    len=endfit-startfit+1;
	fits = zeros(len,1);
    npts = length(indvars);
    invm = inv(jacobain);     
    
			for i=1:1:npts
				for j=1:1:nindvars
					fits(i) = fits(i) + coef(j)*indvars(j,i);
                end
            end
            
            	
			for i = startfit:1:endfit
				tempc2= tempc2 + (fits(i)-data(i))^2;
            end
            
            c2 = tempc2/(len-nindvars);
            
            for i = 1:1:nindvars
            se(i) = sqrt(c2*invm(i,i)); %stand error
            end
		
		
end

%       for i=1:1:length(invm)
% 			for j=1:1:length(jvector)
% 				outcoef(i)= outcoef(i) + invm(i,j)*jvector(j);
%             end
%        end
%             
            
            
% 		double[] se=new double[nindvars];
% 		double c2=get_c2(outcoef,data,weights);
% 		//int length=endfit-startfit+1;
% 		//c2*=(double)(length-nindvars)/(double)(length-1);
% 		for(int i=0;i<nindvars;i++) se[i]=Math.sqrt(c2*inv[i][i]);
% 		return new double[][]{outcoef,se};
%         
%         
%         public double get_c2(double[] coef,float[] data,float[] weights){
% 		//error

