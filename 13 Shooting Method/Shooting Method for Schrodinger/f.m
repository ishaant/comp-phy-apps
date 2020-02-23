function [del_beta] = f(E)
%The function that creates the mismatch value at the given value of x_m for
%the energy E. This is the function whose roots gives the energy eigen
%value.
%E: The starting value of energy

global x_il
global x_ir
global x_m
global dx
global u20l
global u20r


%Calling the RK2_qm function to integrate and find the value one gets for
%u1l(x_m) and u1r(x_m) for the given starting value of E

[u1L,u2L,~] = RK2_qm(u20l,E,x_il,x_m,dx,1);
[u1R,u2R,~] = RK2_qm(u20r,E,x_ir,-x_m,dx,-1);

%Findig the 'mismatch' value
NL = size(u1L,2);
NR = size(u1R,2);
del_beta = u1R(NR)*u2L(NL) + u1L(NL)*u2R(NR); %The quantity to be minimized
end


