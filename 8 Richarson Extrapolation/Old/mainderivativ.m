syms x
f = x*exp(x);
%h=0.0001;
%[f1,f2,f3,error]=derivativ(f, x, h,interv);

N= 12;

for i= 1:N 
    
    h= 10^-(i-1);

interv = [0 h*100];

[f1,f2,f3,error]=derivativ(f, x, h,interv);

err(i,1)=abs(error(1,1));
err(i,2)=abs(error(1,2));
err(i,3)=abs(error(1,3));
hx(i)=h;

end
plot(log10(hx),log10(err))

