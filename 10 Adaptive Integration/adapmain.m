clc, clear all

syms x

f = sin(1/x);

fintegrated=matlabFunction(int(f,x));


bin = 100;

interv = [0.001 1];

tol=0.00001;


truevalue=fintegrated(1)-fintegrated(0.001)
adaptivevalue = adaptiveint(f, x, interv, bin, tol)

