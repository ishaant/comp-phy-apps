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
        if (f(a)*f(b)<0)            
                     
         c = (a*f(b)-b*f(a))/(f(b)-f(a));
        
         error=abs(b-c)/abs(b);  
         
         b=c;
                      
              
        else            
         
         c = (a*f(b)-b*f(a))/(f(b)-f(a));
        
         error=abs(a-c)/abs(a);  
         
         a=c;
        
        
        end
        
        
    end

    root=c

end
