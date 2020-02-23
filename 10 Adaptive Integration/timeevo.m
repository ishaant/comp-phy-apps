clc, clear all


syms k
h=1;
a=1;
m=1/2;
x=-10;
e=0.0001;
delta=10^2;
tol=0.001;
bin = 100;

interv1 = [0 e];
interv2 = [e delta];
interv1neg = [-e 0];
interv2neg = [-delta -e];
t=5;


for i=1:200
    
    x= x+0.1;

f = (sin(k*a)/k)*exp(1i*(k*x-h^2*k^2*t/(2*m)))*1/(pi*sqrt(2*a));

% fintegrated=matlabFunction(int(f,k));

% truevalue(i)=fintegrated(-1*delta)-fintegrated(delta);

int0e=isemiopen(f, k, interv1, bin);
intedelta=adaptiveint(f, k, interv2, bin, tol);
intnegativee0=isemiopen(f, k, interv1neg, bin);
intedeltanegative=adaptiveint(f, k, interv2neg, bin, tol);

integvalue(i)= int0e + intedelta + intedeltanegative + intnegativee0;
y(i)= x

output(i)= abs(integvalue(i));
end

integvalue(1)
% truevalue(1)
plot(y,output)