function [noisedata] = cubenoise(cubedata)
% acquire data from the cube and add shot noise
getxy = size(cubedata);
noisedata = zeros(getxy);
 for i = 1:getxy(1)
     for j = 1:getxy(2)     
         noisedata(i,j,:) = generate_noise(cubedata(i,j,:));
     end
 end
end


