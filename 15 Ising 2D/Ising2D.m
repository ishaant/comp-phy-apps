function [Mavpp, Eavpp, Chavpp] = Ising2D(h,kbT,N,NMC)

%NIsing2D: The program that does MonteCarlo simulation of 2D Ising model.
%Note that J is set to one (which means 1/beta and h are measured in untis of
%J, the coupling constant between neighbouring spins). Please refer to 1D
%Ising code for detailed comments on various segments.

%h   : Magnetic field
%beta: Inverse temperature
%N   : Number of spins in the system
%NMC : Number of MonteCarlo runs

NR = 10000;       %The number of runs before the system is expected to equilibriate
S = ones(N,N);    %Allocating space for the spin variables
Nsq = N^2;
                    
Mag = zeros(1,NMC);
Eng = zeros(1,NMC);

Mavpp = zeros(1,size(kbT,2));
Eavpp = zeros(1,size(kbT,2));
Chavpp = zeros(1,size(kbT,2));

%Initializing the state to a random state
for i = 1:N
    for j = 1:N
        if rand < 0.5
            S(i,j) = 1;
        else
            S(i,j) = -1;
        end
    end
end


%Finding the energy of the initial configuration
E = 0;
for i = 1:N-1
    for j = 1:N-1
        snsum = S(i+1,j)+S(i,j+1) + h;
        E = E - S(i,j)*snsum;
    end
end

for k = 1:N-1
    snsum = S(1,k) + S(N,k+1) + h;
    E = E - S(N,k)*snsum;
    snsum = S(k,1) + S(k+1,N) + h;
    E = E - S(k,N)*snsum;
end

E = E - S(N,N)*(S(1,N) + S(N,1) + h);

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
            i = 1+round((N-1)*rand);
            j = 1+round((N-1)*rand);
                
            r = i+1;
            if r == N+1
                r = 1;
            end
            u = j+1;
            if u == N+1
                u = 1;
            end
            l = i-1;
            if l == 0
                l = N;
            end
            d = j-1;
            if d == 0
                d = N;
            end
            snsum = S(r,j) + S(i,u) + S(l,j) + S(i,d) + h;
            dE = 2*S(i,j)*snsum;

            if dE < 0
                E = E + dE;
                S(i,j) = -1*S(i,j);
            elseif rand < exp(-beta*dE)
                E = E + dE;
                S(i,j) = -1*S(i,j);
            end
        end
    end

    %The MC runs in which measurements are made
    Eng(1) = E;
    Mag(1) = sum(sum(S));
    for n = 2:NMC-1
        for k = 1:Nsq 
            i = 1+round((N-1)*rand);
            j = 1+round((N-1)*rand);
            
            r = i+1;
            if r == N+1
                r = 1;
            end
            u = j+1;
            if u == N+1
                u = 1;
            end
            l = i-1;
            if l == 0
                l = N;
            end
            d = j-1;
            if d == 0
                d = N;
            end
        
            snsum = S(r,j) + S(i,u) + S(l,j) + S(i,d) + h;
            dE = 2*S(i,j)*snsum;

            if dE < 0
                E = E + dE;
                S(i,j) = -1*S(i,j);
            elseif rand < exp(-beta*dE)
                E = E + dE;
                S(i,j) = -1*S(i,j);
            end
            
        end
        Mag(n) = sum(sum(S));
        Eng(n) = E;

    end

    %The average energy, magnetisation and specific heat per spin

    Eavpp(t) = sum(Eng)/(N*N*NMC); %Average energy per spin
    Mavpp(t) = sum(Mag)/(N*N*NMC); %Magnetisation per spin

    Chavpp(t) = 0;
    Engpp = Eng/(N*N);
    for i = 1:size(Eng,2)
         Chavpp(t) = Chavpp(t) + (Engpp(i) - Eavpp(t))^2;
    end
    Chavpp(t) = (beta^2)*Chavpp(t)/(NMC); %C_h per spin in units of K_B
    
end

end

