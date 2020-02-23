function out=MultiWell(E)
% Paramters
W=5*10^-9;
D=0.5*10^-9;
m=1;
Vo=50;

% Defining Alpha and Beta 
alph=10^9*5.062884*sqrt(E);
beta=10^9*5.062884*sqrt((Vo-E));

x_init=[1;beta]; % Waveform at boundary


P_allowed=[cos(alph*W) , 1/alph*sin(alph*W); -alph*sin(alph*W) , cos(alph*W) ];
P_forbidden=[cosh(beta*D) ,1/beta*sinh(beta*D);beta*sinh(beta*D) , cosh(beta*D)];

k=P_allowed*P_forbidden*P_allowed;

temp=k*x_init;

psi=temp(1,:);
psidash=temp(2,:);

out=(psidash+beta*psi);

end