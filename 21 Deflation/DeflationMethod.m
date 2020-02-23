function EigenMat=DeflationMethod(A)

    N=size(A,1);
    B=A;
    eigval=zeros(N,1);
    tol=0.01;
    
    for i=1:N
        [eig,eigvector1, ~]=eigenmax(B,tol);
        x=rand(size(eigvector1));
        x=x'/(x'*eigvector1);
        B=B-eig*eigvector1*x;
        i
        eigval(i)=eig;

    end

    EigenMat=(eigval);
end