function [eigenvaluemin,vector,iter] = eigenmin(A,Tol)
B=inv(A);
[eigenvaluemininv,vector,iter]=eigenmax(B,Tol);
eigenvaluemin=(1/eigenvaluemininv);
end


