% Function for finding root using Secant method. The code works when
% the the two initial guess is close to one of the roots.
function [Root, Count] = Secant(X_in, X_pin, Tol, Fun)

Error = 10*Tol;   %Initializing Error variable to be larger than Tol
Count = 0;        %Initializing the Count variable
Count_max = 50;   %Maximum value of Count beyond which search is terminated


while Error > Tol
    Count = Count + 1;
    X_new = X_in - Fun(X_in)*(X_in-X_pin)/(Fun(X_in)-Fun(X_pin));
    Error = abs((X_new - X_in)/X_new);
    X_pin = X_in;
    X_in  = X_new;
    
    if Count > Count_max
        Root = 'Not Found';
        return
    end
end

Root = X_new; %Storing the final value of the root

end