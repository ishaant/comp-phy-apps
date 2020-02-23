function [forward,backward,central] = derivative(x_i)


f = @(x) x*exp(x);
f_prime = @(x) (1+x)*exp(x);

i = 4;
forward = zeros(1,100000);
backward = zeros(1,100000);
central = zeros(1,100000);
j = 1;
h = 0.0001;
while h <= 0.0002
    

forward(j) = (f(x_i + h) - f(x_i))/h;
backward(j) = (f(x_i) - f(x_i - h))/h;
central(j) = (f(x_i + h) - f(x_i - h))/(2*h);

error_f = abs(f_prime(x_i) - forward(j));

h = h*(10^0.0000001);
j = j + 1;

end