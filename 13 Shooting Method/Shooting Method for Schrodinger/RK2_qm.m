function [u1,u2,x] = RK2_qm(u20,E,x_i,x_m,dx,sgn)
% RK-2 routine that can be used to solve the Quantum Mechanical 
% eigenvalue problem with boundary conditions in conjunction with a root 
% finding alogrithm.
% E: The energy value.

global beta


K = 1;

x = x_i:dx:x_m;

%Initialisation of various variables
Nx = size(x,2);         %Size of the time vector, x
u1 = zeros(1,Nx);       %allocating space for the variable 
u2 = zeros(1,Nx);       %allocating space for the variable

u1(1) = 0;
u2(1) = u20;


%The function definitions
v =  @(y)  (sgn*y)^2 + beta*(sgn*y)^4; %The potential
f1 = @(y) y;                        %Used in du_1/dt  
f2 = @(y,z) K*(v(y)-E)*z;           %Used in du_2/dt

%The loop implementing adaptive RK-3
for i = 1:Nx-1
        %The first set of function evaluations
        ku11 = f1(u2(i))*dx;
        ku21 = f2(x(i),u1(i))*dx;

        %The second set of function evaluations
        ku12 = f1(u2(i)+ku21*0.5)*dx;
        ku22 = f2(x(i)+0.5*dx,u1(i)+ku11*0.5)*dx;
        

        %Final update of all variables to next time step
        u1(i+1) = u1(i) + ku12;
        u2(i+1) = u2(i) + ku22;
        
end

end



