function tn = simpint(fx, x, interv, bin)



f=matlabFunction(fx);

h=(interv(2)-interv(1))/bin;

f0 = f(interv(1));

for i=1:bin
   
    fint(i)=f(interv(1)+h*i);
    
   
end

isimp = h/3*(f0+fint(bin));

    for i = 1:bin-1
        
        if mod(i,2)==0
            
            isimp= isimp + h/3*2*fint(i);
        
        else
            
            isimp= isimp + h/3*4*fint(i);
        
        
        end
    
    end


    
tn= isimp;

end

