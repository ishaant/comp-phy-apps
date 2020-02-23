function tn = adaptiveint(fx, x, interv, bin, tol)



f=matlabFunction(fx);

h=(interv(2)-interv(1))/bin;

f0 = f(interv(1));

for i=1:bin
   
    fint(i)=f(interv(1)+h*i);
    
   
end

Ione=simpint(fx, x, interv, bin);
Itwoleft=simpint(fx, x, [interv(1),(interv(1)+interv(2))/2], bin);
Itworight=simpint(fx, x, [(interv(1)+interv(2))/2,interv(2)], bin);
Itwo= Itwoleft+Itworight;

if (abs(Itwo-Ione)/15<tol)
    tn=(16*Itwo-Ione)/15;
    
else
    tn= adaptiveint(fx, x,[interv(1),(interv(1)+interv(2))/2], bin, tol/2) + adaptiveint(fx, x, [(interv(1)+interv(2))/2,interv(2)], bin, tol/2);
    
    
    
% isimp = h/3*(f0+fint(bin));
% 
%     for i = 1:bin-1
%         
%         if mod(i,2)==0
%             
%             isimp= isimp + h/3*2*fint(i);
%         
%         else
%             
%             isimp= isimp + h/3*4*fint(i);
%         
%         
%         end
%     
%     end


    
%tn= isimp;

end

