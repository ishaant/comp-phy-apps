function x_final= trajectory1(E)


alpha=1;
beta=0.00;

fa=@(y,v,psi)    -(E-alpha*y^2-beta*y^4)*psi;
fv=@(y,v)    v;
fx = 1;

f= @(x) [ fv(x(1),x(2));fa(x(3),x(2),x(1));fx];

        x(3,1)=-10;
        x(2,1)=0.00001;
        x(1,1)=0;

        h=0.01;

        iter=1100;

       
        for i=1:iter

                        k1=f(x(:,i));

                        k2=f(x(:,i)+0.5*h*k1);


                        x(:, i+1)=x(:,i)+h*k2;

        end



x_final(1)=x(1,iter+1);
x_final(2)=x(2,iter+1);

end