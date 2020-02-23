function tn = richardsonext(fx, x, h, n, val)

ydash = matlabFunction(diff(fx,x));

f=matlabFunction(fx);

fcentral = @(f, h, val) (f(val+h)-f(val-h))/(2*h);


    for i=1:n-1
    
    fcentral = @(f, h, val) (4^i*fcentral(f,h,val)-fcentral(f,2*h,val))/(4^i-1);
   

    end

i=n;


tn= fcentral(f, h, val);

end

