% Running part

clc, clf, clear, close all
clear all

xfin=2;

v0=falseposit(@(x) trajectory(x)-xfin,[0,2],0.0001)

%{
for i=1:200
    v0=i*0.1;
    y(i)=trajectory(v0);
end

plot(y)
%}

fa=@(y,v)    -y-(y^2-1)*v;
fv=@(y,v)    v;

f= @(x) [ fv(x(1),x(2));fa(x(1),x(2))];

x(1,1)=1;
x(2,1)=v0;

h=0.001;

iter=20000;

t=0:h:h*iter;

for i=1:iter

				k1=f(x(:,i));

				k2=f(x(:,i)+0.5*h*k1);

				k3=f(x(:,i)+0.5*h*k2);          % Runge-Kutta

				k4=f(x(:,i)+h*k3);

				
				x(:, i+1)=x(:,i)+(h/6)*(k1+2*k2+2*k3+k4);
                
               
end

x_final=x(1,iter+1)

plot(t,x)

figure

plot(x(1,:),x(2,:))

