function [output,t]= euler_forward(grad,var_total,x0,t_max,steps)
    
    h=t_max/steps;
    x=zeros(var_total,steps);
    x(:,1)=x0;
    t=zeros(steps,1);
    t(1)=0;
    
    for i=1:steps
        
        x(:,i+1)=x(:,i)+ grad(x(:,i))*h;
        t(i+1)=t(i)+h;
    
    end
    output=x;

    end