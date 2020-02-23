function [root] = falseposit(f,interv,tol)

error=10*tol;

a=interv(1);
b=interv(2);
count=0;
% 
% if f(a)*f(b)>0
%     
%     return 'Root not Found'

    while error>tol    
        
        count=count+1;
                     
         c = (a*f(b)-b*f(a))/(f(b)-f(a));
        
         error=abs(b-c)/abs(b);  

        
        
    end

    root=c

end
