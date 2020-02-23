clc, clear all

syms x
f = sin(x)*exp(x);



h=0.1;
val=2;
N= 5;

ydash = matlabFunction(diff(f,x));


root=richardsonext(f, x, h, N, val)


trueval= ydash(val);

for i= 1:N 
    
   root(i)=richardsonext(f, x, h, i, val);
   error(i)= trueval-root(i);
   xax(i)=i;
   
end



plot(xax,log10(error))
%}
