%main
clc, clear all;

f1=@(x) x^3/(1-exp(-x));


% xp=100;
% yp = 100;
% 
% f2=@(x,y) 1/(sqrt((x-xp)^2+(y-yp)^2));
% 
% answer2=vpa(multigausslegendre(f2))

answer1=gausslaguerre(f1);

N=100

for i=1:N
    
    xp= -50 + 1*i
    
    for j=1:N
        
        yp = -50 + 1*j;
        
    f2=@(x,y) 1/(sqrt((x-xp)^2+(y-yp)^2));

    answer2=multigausslegendre(f2);

    sth(i,j)=answer2;
    
            if i==1
                
                yax(j)=yp;

            end
    end
    
    xax(i)=xp;
    
end

contour(xax,yax,sth)
disp ('Answer1')
disp (answer1)

