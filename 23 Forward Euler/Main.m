t_max=10;

lambda=10;

x0=[2,0];

v= @(x)[ x(2); -(lambda^2)*x(1)];

h=0.01;

steps=(t_max/h);

[y,t]=euler_forward(v,max(size(x0)),x0,t_max,steps);
plot(t,y(1,:))