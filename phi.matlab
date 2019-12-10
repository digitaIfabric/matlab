function[ result ] = phi(n)

% function[ result ] = phi(n)
% 
% This function calculates the golden ratio
% 
% INPUT 
% 
% Name Units Type Size Descrip.
%   n   n/a   float 1,1              # of times to iterate     
% 
% 
% Output 
% 
%  Golden Ratio

if(n==0)
    result = 1;
    
else
    
    result = 1 + (1/phi(n-1));
    
end








return
end
