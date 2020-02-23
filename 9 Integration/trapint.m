function tn = trapint(fx, x, interv, bin)



f=matlabFunction(fx);

h=(interv(2)-interv(1))/bin;

f0 = f(interv(1));

for i=1:bin
   
    fint(i)=f(interv(1)+h*i);
    
   
end


ict= h*(((f0-fint(bin))/2)+sum(fint));


tn= ict;

end

