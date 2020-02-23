%Script for find the energy eignestates and wavefunctions of the Schroding
%er equation using shooting method.

%Global variable declarations to be used in the function f where it is
%passed on to the RK2_qm code
global x_il
global x_ir
global x_m
global dx
global u20l
global u20r
global beta

x_il = -10;      %The starting value to far left (potential and energy specific)
x_ir = -10;      %Negative of the starting value to far right (potential and energy specific)
x_m = 0.5;       %The point where the matching takes place
dx = 0.001;      %Step size for the simulation
u20l = 1.0e-20;  %The initial value used for the function derivatie on the left
u20r = 1.0e-20;  %The initial value used for the funciton derivative on the right
beta = 1;        %The relative strenght of the quartic term


%Calling the secant routine to find the energy eigenvalue (The first two
%entries is the search location
[r, c] = Secant(3-0.2,3+.3,1.0e-6,@f);

%Reconstructing the wave function using the value of energy determined.
[u1l,~,xl] = RK2_qm(u20l,r,x_il,x_m,dx,1);   %The 'left' part
[u1r,~,xr] = RK2_qm(u20r,r,x_ir,-x_m,dx,-1); %The 'right' part

alph = u1r(size(xr,2))/u1l(size(xl,2)); %Scaling factor for the left part
u1l  = u1l*alph;                        %Scaling the left part

%Wavefunction (unnormalized) plotting
figure
plot(xl,u1l)
hold on
plot(-xr,u1r) %The right part has to be appropriately reflected
