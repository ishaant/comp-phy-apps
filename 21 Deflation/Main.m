
L=1;
h=1e-2;
N=L/h;
T=1;
A=zeros(N-1,N-1);
mu_0=0.954*1e-3;


%% Part 1
mu=ones(N-1,1)*mu_0;
%
A(1,1)=-2*T/(mu(1)*h^2);
A(1,2)=T/(mu(1)*h^2);
for i=2:N-2
        A(i,i-1)=T/(mu(i)*h^2);
        A(i,i)=-2*T/(mu(i)*h^2);
        A(i,i+1)=A(i,i-1);
end
A(N-1,N-2)=T/(mu(N-1)*h^2);
A(N-1,N-1)=-2*T/(mu(N-1)*h^2);
omegas=eigs(A,5,'smallestabs');
tic
B1=DeflationMethod(inv(A));
C1=ones(size(B1));
C1=C1./B1;
timetaken=toc;
%% Part 2
mu_0=0.954*1e-3;
delta=0.5*1e-3;
for i= 1:N-1
    mu(i)=mu_0+(i*h-L/2)*delta;
end
%
A(1,1)=T/(mu(1)*h^2);
A(1,2)=-2*T/(mu(1)*h^2);
for i=2:N-2
        A(i,i-1)=T/(mu(i)*h^2);
        A(i,i)=-2*T/(mu(i)*h^2);
        A(i,i+1)=A(i,i-1);
end
A(N-1,N-2)=T/(mu(N-1)*h^2);
A(N-1,N-1)=-2*T/(mu(N-1)*h^2);
omegas2=eigs(A,5,'smallestabs');
% omegas2=sqrt(-1*omegas2)   
B2=DeflationMethod(A);

