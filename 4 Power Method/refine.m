function [eigenrefine,vector,iter] = refine(A,approx,Tol)
A=A-approx*eye(size(A,1),size(A,2));
B=inv(A);
[x,vector,iter]=eigenmin(A,Tol);
eigenrefine=x+approx;
end


