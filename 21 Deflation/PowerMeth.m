function [Eig,Eig_vec,Count ] = PowerMeth(A,Tol)
%PowerMeth determines the largest eigenvalue and the
%corresponding eigenvector using the inverse power method

% Eig : Will store the largest eigenvalue (eventually)
% Eig_vec : Will store the eigenvector corresponding to the largest
% eigenvalues
% A : The matirx whose eigenvalue is to be determined
% Tol : The relative accuracy to which the answer is to be found

%Determining the size of the matrix and chekcing whether it is square
N = size(A,2);
if N ~= size(A,1)
    fprintf('The matrix is not square');
    return
end
 
Error = 10*Tol; %Initialization of the Error variable (used for tolerence check)
Count = 1;      %Count (used for counting the number of iterations)
N_max = 1000;   %N_max (the maximum number of iterations to be carried out)

p = rand(N,1);  %Starting with a random guess for the eigenvector.
p = p/norm(p);

pn = A*p;       %Next guess for the eignevector
Eig = (p'*pn);  %Initializing the eigenvalue

%The loop for updating the eigenvector and the eigenvalue. The loop is
%exited if either the Errror is below tolerance or the iterations have
%exceed N_max
while (Error > Tol && Count < N_max)
    p = pn/norm(pn);       %Normalizing the 'latest' eigenvector
    pn = A*p;              %Finding the 'next' eigenvector
    Eign = (p'*pn);        %Findig the 'next' eigenvalue
    Error = abs((Eign- Eig)/Eign); %Checking for convergence
    Eig = Eign;                    %Updating the eigenvalue
    Count = Count+1;               %Updating the count
end

Eig_vec = pn/norm(pn);   %Finding the corresponding normalized eigenvector

%Storing a warning message in Count if iterations reached N_max
% if Count == N_max
%     Count = 'Max number of iterations reached';
%     Eig = 'Max number of iterations reached';
%     Eig_vec = 'Max number of iterations reached';
% end


    
end

