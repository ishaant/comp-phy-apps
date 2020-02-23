function [Mavpp, Eavpp, Cvavpp] = XY2D(kbT,N,NMC)

%XY2D: The program that does MonteCarlo simulation of 2D XY model.
%Note that J is set to one (which means 1/beta and h are measured in untis of
%J, the coupling constant between neighbouring spins)..

%h   : Magnetic field
%beta: Inverse temperature
%N   : Number of spins in the system
%NMC : Number of MonteCarlo runs

NR = 10000;       %The number of runs before the system is expected to equilibriate
S = zeros(N,N);    %Allocating space for the spin variables
Nsq = N^2;
dth = 0.1*2*pi;       %Maximum angle changed
dtht2 = 2*dth;    %Storing an auxillary variable to be used in the code
                    
Mag = zeros(1,NMC);
Eng = zeros(1,NMC);

Mavpp = zeros(1,size(kbT,2));
Eavpp = zeros(1,size(kbT,2));
Cvavpp = zeros(1,size(kbT,2));

%Initializing the state to a random state
for i = 1:N
    for j = 1:N
        S(i,j) = 2*pi*rand;
    end
end


%Finding the energy of the initial configuration
E = 0;
for i = 1:N-1
    for j = 1:N-1
        enn = cos(S(i+1,j) - S(i,j)) + cos(S(i,j+1) - S(i,j));
        E = E - enn;
    end
end

for k = 1:N-1
    enn = cos(S(1,k) - S(N,k)) + cos(S(N,k+1)-S(N,k));
    E = E - enn;
    enn = cos(S(k,1) - S(k,N)) + cos(S(k+1,N) - S(k,N));
    E = E - enn;
end

E = E - (cos(S(1,N) - S(N,N)) + cos(S(N,N) - S(N,1)));

%Temperature scanning loop
for t = 1:size(kbT,2)
    %The starting and end temperature fixed for the annealing runs
    if t == 1
        kbts = kbT(1)*2;
    else
        kbts = kbT(t-1);
    end
    kbte = kbT(t);

    %Relaxation runs: The MonteCarlo runs using Metropolis algorithm for equilibriation. 
    %Note that in this loop we are not measuring any of the physical quantities.
    for n = 1:NR
        kbt = kbte + (NR-n)*(kbts- kbte)/NR;
        beta = 1/kbt;
        for k = 1:Nsq
            i = randi(N);
            j = randi(N);
            if i == N
                r = 1;
            else
                r = i+1;
            end
            if j == N
                u = 1;
            else
                u = j+1;
            end
            if i == 1
                l = N;
            else
                l = i-1;
            end
            if j == 1
                d = N;
            else
                d = j-1;
            end
            nsp = S(i,j) + dtht2*(rand - 0.5);
            enn = cos(S(r,j) - S(i,j)) + cos(S(l,j) - S(i,j)) + cos(S(i,u) - S(i,j)) + cos(S(i,d) - S(i,j));
            nenn = cos(S(r,j) - nsp) + cos(S(l,j) - nsp) + cos(S(i,u) - nsp) + cos(S(i,d) - nsp);
            
            dE = enn - nenn;

            if dE < 0
                E = E + dE;
                S(i,j) = nsp;
            elseif rand < exp(-beta*dE)
                E = E + dE;
                S(i,j) = nsp;
            end
        end
    end

    %The MC runs in which measurements are made
    for n = 1:NMC
        for k = 1:Nsq 
            i = randi(N);
            j = randi(N);
            if i == N
                r = 1;
            else
                r = i+1;
            end
            if j == N
                u = 1;
            else
                u = j+1;
            end
            if i == 1
                l = N;
            else
                l = i-1;
            end
            if j == 1
                d = N;
            else
                d = j-1;
            end
            nsp = S(i,j) + dtht2*(rand - 0.5);
            enn = cos(S(r,j) - S(i,j)) + cos(S(l,j) - S(i,j)) + cos(S(i,u) - S(i,j)) + cos(S(i,d) - S(i,j));
            nenn = cos(S(r,j) - nsp) + cos(S(l,j) - nsp) + cos(S(i,u) - nsp) + cos(S(i,d) - nsp);
            
            dE = enn - nenn;

            if dE < 0
                E = E + dE;
                S(i,j) = nsp;
            elseif rand < exp(-beta*dE)
                E = E + dE;
                S(i,j) = nsp;
            end
        end   
        Mag(n) = sqrt(sum(sum(cos(S)))^2 + sum(sum(sin(S)))^2);
        Eng(n) = E;

    end

    %The average energy, magnetisation and specific heat per spin

    Eavpp(t) = sum(Eng)/(N*N*NMC);
    Mavpp(t) = sum(Mag)/(N*N*NMC);

    Cvavpp(t) = 0;
    Engpp = Eng/(N*N);
    for i = 1:size(Eng,2)
         Cvavpp(t) = Cvavpp(t) + (Engpp(i) - Eavpp(t))^2;
    end
    Cvavpp(t) = (beta^2)*Cvavpp(t)/NMC;
    
end

end

