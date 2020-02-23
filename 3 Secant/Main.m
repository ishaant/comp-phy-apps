clear all

%% Intilaizing variable

root=zeros(20,1);
count=root;
x=root;
%%running secant across different initial values to find roots

for i=1:20
disp(i)
 x(i)=i*2;
[root(i),count(i)]=Secant(x(i), x(i)+2, 1e-8, @MultiWell);

end

plot(x, root,'.')
hold on;
plot(x,x);plot(x,x+2)