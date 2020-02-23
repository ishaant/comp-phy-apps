function [d]= D_odd(e)

% k=0 ;
% d = sin(y)-((cos(y)/y)-(sin(y)/(y^2)))*50;
a=0.3;
Vo=10;

x= @(e) sqrt(e);
y= @(e) sqrt(Vo-e);

k=5.062884;
d=(-a*k^2*y(e)-k)*cos(a*k*x(e))/(2*x(e))+(a*k^2/2+k/(2*y(e)))*sin(a*k*x(e));
end





