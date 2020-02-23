function [fplus,fminus,fcentral,error]=derivativ(fx, x, h, interv)

i=1;

ydash = matlabFunction(diff(fx,x));
f=matlabFunction(fx);

while interv(1)<interv(2)
    
    fplus(i)= (f(interv(1)+h)-f(interv(1)))/h;
    fminus(i) = (-f(interv(1)-h)+f(interv(1)))/h;
    error(i,1) = ydash(interv(1))-fplus(i);
    error(i,2) = ydash(interv(1))-fminus(i);
    fcentral(i)=(fplus(i)+fminus(i))/2;
    error(i,3) = ydash(interv(1))-fcentral(i);
    interv(1)= interv(1)+h;
    i=i+1;
    
    
    
end

fcentral=(fplus+fminus)/2;


end