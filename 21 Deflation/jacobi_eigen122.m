function [eigenmat] = jacobi_eigen122(A)
n=size(A,1);
count_max=1000;
count=0;
A_new=A;

    while count<count_max
        for i=1:n-1
            for j=(i+1):n
                if i~=j
                    
                    phi=(1/2)*atan((-2)*A(i,j)/(A(i,i)-A(j,j)));
                    
                    A_new(i,i)= A(i,i)-tan(phi)*A(i,j);
                    A_new(j,j)= A(j,j)+tan(phi)*A(i,j);      
                    A(j,j)=A_new(j,j);
                    A(j,j)=A_new(j,j);
                    A_new(i,j)=0;
                    A(i,j)=0;
                    for r=1:n
                        if(r~=i && r~=j)
                        
                        A_new(i,r)=cos(phi)*A(i,r)-sin(phi)*A(j,r);
                        A_new(j,r)=cos(phi)*A(j,r)+sin(phi)*A(i,r);
                        A_new(r,j)=A_new(j,r);
                        A_new(r,i)=A_new(i,r);
                        A(j,r)=A_new(j,r);
                        A(i,r)=A_new(i,r);
                        A(r,j)=A_new(j,r);
                        A(r,i)=A_new(i,r);                        
                        
                        end
                    end
                             A(j,i)=A(i,j);
                             A_new(j,i)=A_new(i,j);
                             A=A_new;
                         
          
                end

            end
        end
 
        
        count= count+1;
    end

    eigenmat=A

end


