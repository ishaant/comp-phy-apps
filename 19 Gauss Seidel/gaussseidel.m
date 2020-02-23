N=1000;


A=zeros(N);

for i=1:N
for j=1:N
  
    if i==(N)/2-100&& j>N/2-400&& j<N/2+400
       
            A(i,j)=-1;
    
        
    elseif  i==(N)/2+100&& j>N/2-400&& j<N/2+400
       
            A(i,j)=1;
        
        
    end

  end
end

for k=1:1000
    for i= 2:N-1
    for j= 2:N-1
         
        if i==(N)/2-100&& j>N/2-400&& j<N/2+400
       
            A(i,j)=-1;
    
        
    elseif  i==(N)/2+100&& j>N/2-400&& j<N/2+400
       
            A(i,j)=1;
     
        else
            A(i,j)= [A(i+1,j)+ A(i,j+1)+ A(i-1,j)+ A(i,j-1)]/4;
        end
    end
    end
end
hold on;
contour(A);

