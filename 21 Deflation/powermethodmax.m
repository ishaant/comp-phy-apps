function Lambda = powermethodmax(B)
    A=B;
    n= size(A,1);
    x = rand(n,1);
    for i = 1:1:1000
        x1=A*x;
        x_norm=(sum(x1.*x1))^(1/2);
        x2=x1/x_norm;
        x=x2;
    end
    C=A*x;
    [maxB, index] = max(abs(C));
    maxB = maxB * sign(C(index));
    Largest =maxB/max(abs(x));
    

    Lambda= Largest;    
    
end