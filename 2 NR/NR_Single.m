% Function for finding root using Newton-Raphson 
% method. 
function [Root, Count] = NR_Single(X_initial, Tol, Fun, Der)

Error = 10*Tol;   %Initializing Error variable to be larger than Tol
Count = 0;        %Initializing the Count variable
%Count_max = 50;   %Maximum value of Count beyond which search is terminated

while Error > Tol
    Count = Count + 1;
    dX = Fun(X_initial)/Der(X_initial);
    X_new = X_initial - dX;
    Error = abs(dX)/abs(X_new);
    X_initial = X_new;

end

Root = X_initial; %Storing the final value of the root
end