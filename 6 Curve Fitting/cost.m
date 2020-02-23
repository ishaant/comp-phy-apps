function [S]= cost(V)

global x
global fx
k=1.38*10^(-23);
T=1845;
c=3*10^8;

S=0;


    for i=1:size(x,2)
        S= S + ((V(1)/(x(i)^5*(exp((V(2)*c)/(k*T*x(i))) - 1)))-fx(i))^2;
    end


end