clear all
x_init=0.1:0.2:9;
tol=0.00001;
x=zeros(1,length(x_init),1);
for i=1:length(x_init)
    [temp,iter]=NewtonRaphson(x_init(i), @F, @D, 0.00001);
    
    if (iter<1000)

        x(i)=temp;

    end
    
end

y1=uniquetol(x,0.00001);

%%

for i=1:length(x_init)
[temp,iter]=NewtonRaphson(x_init(i), @F_odd, @D_odd, 0.00001);
if (iter~=1000)
    
    z(i)=temp;

end
end

y2=uniquetol(z,0.00001);
