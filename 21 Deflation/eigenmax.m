function [eigvalue,eigvector,iter] = eigenmax(A,Tol)

N=size(A,1);
x=10*rand(N,1);
    iter=0;
    error=10*Tol;
    count_max=10000;
    while (error>Tol && iter<count_max)
        y=A*x;
       x=x/norm(x);
        y=y/norm(y);
        error=norm(y-x);
        x=y;
        iter = iter+1;
        
    end
     C=A*x;
    [maxB, index] = max(abs(C));
    maxB = maxB * sign(C(index));
    [maxC, index2] = max(abs(x));
    maxC = maxC * sign(x(index2));
    
    eigvalue =maxB/maxC;
    eigvector=x;  
    end
   