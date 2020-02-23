function [eigenmat] = jacobi_eigen121(A)
n=size(A,1);
count_max=1000;
count=0;
A_new=A;
tol=0.01;

    while (count<count_max && norm(A_new-A)>tol)
        for i=1:n
            
            for j=1:i-1
                
                if i~=j
                    
                    phi=(1/2)*atan(-2*A(i,j)/(A(i,i)-A(j,j)));                    
                    A_new(i,:)=cos(phi).*A(i,:)-sin(phi).*A(j,:);
                    A_new(j,:)=cos(phi).*A(j,:)+sin(phi).*A(i,:);
                    A_new(i,i)= A(i,i)-tan(phi).*A(i,j);
                    A_new(j,j)= A(j,j)+tan(phi).*A(i,j);
                    A_new(:,j)=A_new(j,:);
                    A_new(:,i)=A_new(i,:);
                    A_new(i,j)=0;
                    A_new(j,i)=0;
                    A=A_new;
                    
                end

            end
            
        end
        
        count= count+1;
    end
    
    if count==count_max
        disp('Root not Found')
    end
   eigenmat=A;
  
      

end


