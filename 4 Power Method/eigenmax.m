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
     p=A*x;
     eigvalue=((p(1,1)/x(1,1)));
    eigvector=x;  
    end
   