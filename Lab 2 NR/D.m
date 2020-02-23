function [d]= D(e)

% k=0 ;
% d = sin(y)-((cos(y)/y)-(sin(y)/(y^2)))*50;
a=0.3;
Vo=10;

x= @(e) sqrt(e);
y= @(e) sqrt(Vo-e);
% k=0.8151503;
% d=k*tan(x(e))/(2*x(e))+1/2*a*k^2*(sec(a*x(e)))^2+k*1/(2*y(e));
k=5.062884;
% 12.8164*a*cos(5.06288*a*sqrt(x)) + (2.53144*Cos[5.06288 a Sqrt[x]])/Sqrt[V - x] + (2.53144 Sin[5.06288 a Sqrt[x]])/Sqrt[x] + (12.8164 a Sqrt[V - x] Sin[5.06288 a Sqrt[x]])/Sqrt[x]
d=(a*k^2*y(e)+k)*sin(a*k*x(e))/(2*x(e))+(a*k^2/2+k/(2*y(e)))*cos(a*k*x(e));
end





