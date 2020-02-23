function [root,iter] = NewtonRaphson(x_guess,fun,funderivative,tol)

iter=0;
Error = 10*tol;
iter_max = 1000 ;

while (Error > tol)&&(iter < iter_max) 
    iter = iter + 1 ;
    dx= -fun(x_guess)/funderivative(x_guess); 
    x_guess = x_guess + dx ;
    Error = abs(dx)/abs(x_guess);
    
end

 root = x_guess;
 disp(root);
 disp(iter);
 
  
    
    


