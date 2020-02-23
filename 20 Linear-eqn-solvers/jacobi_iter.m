function [eigenmat] = jacobi_iter(A,B)
n=size(A,1);
X=rand(n,1);
count_max=1000;
count=0;
tol=0.01;
Error=10*tol;
X=X*0;

    while (count<count_max && Error>tol)
      Y=A*X;
      
      X_init=X;
      
      for i=1:n
        X(i)=(B(i)-Y(i))/A(i,i)+X_init(i);
        
      end
        count= count+1;
        
        Error=norm(X_init-X)/norm(X_init);
        
    end

    eigenmat=X;

end


