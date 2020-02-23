function [diff] = Rextra(f,x,h,n)

%Rextrap finds the numerical derivatives of the function f at x with
%stepsize h in central difference and using Richardson extrapolation to
%reduce the error.

if n == 0
    diff = (f(x+h) - f(x-h))/(2*h); %Central difference
else
    diff = (2^(2*n)*Rextra(f,x,h,n-1) - Rextra(f,x,2*h,n-1))/(2^(2*n) - 1);
end
    

end

