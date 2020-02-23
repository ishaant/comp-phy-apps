clc, clear all

syms x
f = exp(-x^2);

fintegrated=matlabFunction(int(f,x));


bin = 100;

interv = [0 1];

trapvalue=trapint(f, x, interv, bin)

simpvalue=simpint(f, x, interv, bin)


trueval=fintegrated(1)-fintegrated(0);

N=20;


for i= 1:N 
    
   xax(i)=2*i; 
   traproot(i)=trapint(f, x, interv, xax(i));
   simproot(i)=simpint(f, x, interv, xax(i));
   traperror(i)= abs(trueval-traproot(i));
   simperror(i)= abs(trueval-simproot(i));
   
end

plot(xax,(traperror))
hold on 
plot(xax,(simperror))

