
    
    function [output,t]= RK3(grad,x0,t_max,steps)
    
    
    var_total=length(x0);
    h=t_max/steps;
    x=zeros(var_total,steps);
    x(:,1)=x0;
    t=zeros(steps,1);
    t(1)=0;
    fx1=grad;
    
    for i=1:steps
    
        k1= fx1(x(:,i),t(i));
        k2= fx1(x(:,i)+h/2*k1,t(i)+h/2);
        k3= fx1(x(:,i)+h*2*k2-h*k1,t(i)+h/2);
        
        x(:,i+1)=x(:,i) + h/6*(k1 +4*k2+2*k3);
        t(i+1)=t(i)+h;
    
    end
    output=x;

    end