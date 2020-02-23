function x_final= trajectory(v0)

fa=@(y,v)    -y-(y^2-1)*v;
fv=@(y,v)    v;

f= @(x) [ fv(x(1),x(2));fa(x(1),x(2))];

x(1,1)=1;
x(2,1)=v0;

h=0.1;

iter=200;

t=0:h:h*iter;

for i=1:iter

				k1=f(x(:,i));

				k2=f(x(:,i)+0.5*h*k1);

				k3=f(x(:,i)+0.5*h*k2);          % Runge-Kutta

				k4=f(x(:,i)+h*k3);

				 

				x(:, i+1)=x(:,i)+(h/6)*(k1+2*k2+2*k3+k4);
                
               
end

x_final=x(1,iter+1);

end