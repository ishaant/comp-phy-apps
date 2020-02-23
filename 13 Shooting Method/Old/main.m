% Running part

clc, clf, clear, close all
clear all

e0=1;
delta=0.5;

E0=secant(@(E) expression(E),[e0-delta,e0+delta],0.0001);


%{
% xfin=2;
% 
% delta=0.5;
% e0=1;
% e1=3;
% e2=5;
% 
% for i=1:100
%     beta=0+i*0.01
%    
%     
% 
% 
% alpha=1;
% 
% 
% fa=@(y,v,psi)    -(E-alpha*y^2-beta*y^4)*psi;
% fv=@(y,v)    v;
% fx = 1;
% 
% f= @(x) [ fv(x(1),x(2));fa(x(3),x(2),x(1));fx];
% 
%         x(3,1)=-10;
%         x(2,1)=0.00001;
%         x(1,1)=0;
% 
%         h=0.01;
% 
%         iter=1100;
% 
%        
%         for i=1:iter
% 
%                         k1=f(x(:,i));
% 
%                         k2=f(x(:,i)+0.5*h*k1);
% 
% 
%                         x(:, i+1)=x(:,i)+h*k2;
% 
%         end
% 
% 
% 
% functx_final(1)=x(1,iter+1);
% x_final(2)=x(2,iter+1);
% 
%     end
% 
%     function x_final= trajectory2f(E)
% 
% 
% alpha=1;
% beta=0.00;
% 
% fa=@(y,v,psi)    -(E-alpha*y^2-beta*y^4)*psi;
% fv=@(y,v)    v;
% fx = 1;
% 
% f= @(x) [ fv(x(1),x(2));fa(x(3),x(2),x(1));fx];
% 
%         x(3,1)=10;
%         x(2,1)=-0.0001;    
%         x(1,1)=0;
%         h=-0.01;
% 
%         iter=900;
% 
%        
%         for i=1:iter
% 
%                         k1=f(x(:,i));
% 
%                         k2=f(x(:,i)+0.5*h*k1);
% 
% 
%                         x(:, i+1)=x(:,i)+h*k2;
% 
%         end
% 
% 
% 
% x_final(1)=x(1,iter+1);
% x_final(2)=x(2,iter+1);
% 
%     end  
% 
%     function x_final= expression(E)
% 
% xL=trajectory1f(E);
% 
% xR=trajectory2f(E);
% 
% 
% x_final=(xL(1)*xR(2)-xL(2)*xR(1));
% 
% 
% end
% 
%     
% E0(i+1)=secant(@(E) expression(E),[e0-delta,e0+delta],0.0001);
% E1(i+1)=secant(@(E) expression(E),[e1-delta,e1+delta],0.0001);
% E2(i+1)=secant(@(E) expression(E),[e2-delta,e0+delta],0.0001);
% e0=E0(i+1);
% e1=E1(i+1);
% e2=E2(i+1);
% 
% end
%}
