global x
x =[0  0.3  0.6  0.9  1.2  1.5  1.8];

global fx
fx =[0.023  2.343  3.681  4.162  3.805  2.536  0.366];

N=size(x,2);

A=eye(N+1);

B=zeros(N+1,1);

for i=1:3
    for j=1:N
        A(i,j)=sum(x.^(j+i-2));
    
        B(i,1)=sum(fx(:).*(x(:).^(i-1)));
        
    end
end

linsolve(A,B)
        

