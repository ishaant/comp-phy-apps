%Plotting Airy pattern

x = [0.01  1.1  2  3.3  4.2  5.0  5.3 7.1  8.9  9.9];
x1=-1*fliplr(x);
x=[x1,x];

fx = [1.0000    0.7331    0.3326    0.0179    0.0044    0.0172    0.0170    0.0001    0.0033    0.0002];
fx1 = fliplr(fx);
fx=[fx1,fx];
N=size(x,2);
A=zeros(1,N);
B=zeros(1,N);
C=zeros(1,N);
D=zeros(1,N);
Y=zeros(N,1);



for i=1:N-1
  
h(i)=x(i+1)-x(i);

end

   Y(1)=0;
   Y(N)=0;
   Co=zeros(N,N);
   Co(1,1)=1;
   Co(N,N)=1;

for i=2:N-1
   
    Y(i)=3*(fx(i+1)-fx(i))/h(i)+(fx(i-1)-fx(i))*3/h(i-1);
    Co(i,i-1)=h(i-1);
    Co(i,i)=2*(h(i-1)+h(i));
    Co(i,i+1)=h(i);
    

end

B=linsolve(Co,Y);

for i=2:N
D(i-1)=fx(i-1);
A(i-1)=(B(i)-B(i-1))/(3*h(i-1));
C(i-1)=(fx(i)-fx(i-1))/h(i-1)-(B(i)+2*B(i-1))*(h(i-1)/3);
end

xabc=[];
yabc=[];

for i=1:N-1
    
    
    px=linspace(x(i),x(i+1),500);
    py=A(i)*(px-x(i)).^3+B(i)*(px-x(i)).^2+C(i)*(px-x(i))+D(i);
    xabc=[xabc, px];
    yabc=[yabc, py];
    
    
end

plot(x,fx,'o')
hold on
plot(xabc,yabc)


    
