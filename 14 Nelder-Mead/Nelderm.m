function [m,E]= Nelderm(N,KbT)

beta=(1/KbT);
Y=ones(N,N);   
for iter=1:1000

    H0=hamilt(Y);
    
    i=randi(N);

    j=randi(N);

    Y(i,j)=-1*Y(i,j);
    
    H1=hamilt(Y);
    
    if (H1>H0)
        
       x = rand;
       if (x>(exp(H0-H1)*beta))
           
           Y(i,j)=-1*Y(i,j);
           
       end
       
    end
    
      

end

H0=hamilt(Y);

E=0;
M=0;


for iter=1:100000
    
    i=randi(N);

    j=randi(N);

    Y(i,j)=-1*Y(i,j);
    
    H1=hamilt(Y);
    
    if (H1>H0)
        
       x = rand;
    
       if (x>(exp((H0-H1)*beta)))
           
           Y(i,j)=-1*Y(i,j);
           
       end
       
    end
    
    H0=hamilt(Y);
    E=E+H0;
    M0=magnetic(Y);
    M=M+M0;
end

E=E/iter;
m=(M)/iter;

end