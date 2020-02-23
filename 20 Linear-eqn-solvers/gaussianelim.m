function X=gaussianelim(N)

A=rand(N);
B=rand(N,1);
X=A\B;
end