function [se] = geterror(coef,data,indvars,jacobain)


	startfit = 1; 
    endfit = 100;
	fitdata = zeros(100,1);
    len=endfit-startfit;
    %temp1 =length(indvars(:,1));
% 	nindvars = 0;
	nindvars = length(indvars(:,1));
    %nindvars = 3; 
    %temp2 = length(indvars);
%     npts = 0;% number of channels
    npts = length(indvars);
    %npts = 100;
    invm = []; 
    outcoef= [];
    tempc2 = 0;
    invm = inv(jacobain);     
    
			for i=1:1:npts
				for j=1:1:nindvars
					fitdata(i) = fitdata(i) + coef(j)*indvars(j,i);
                end
            end
            
            	
			for i = startfit:1:endfit
				tempc2= tempc2 + (fitdata(i)-data(i))^2;
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

