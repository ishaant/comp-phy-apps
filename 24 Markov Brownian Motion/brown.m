clc, clear all

kbT=10;


% Step Size
 h = 0.001;
 tfinal = 100;
 N =ceil(tfinal/h);

gamma=1000;
m=1;
kbT= 10;
g=9.8;
var=sqrt(2*kbT*h/(m*gamma));

m=1;

fx1 =@(x,t) (randn*var)/(m*gamma) - g/(gamma)^2;

t(1)=0;
x1(1) = 0.1; 

x_euler(1)=x1(1);
x_impeuler(1)=x1(1);
x_mpeuler(1)=x1(1);



%{ 

for i=1:N
    
    x_euler(i+1)=x_euler(i)+ h*fx(x_euler(i))
    x_mpeuler(i+1)=x_mpeuler(i)+ fx(x_mpeuler(i)+h*f(x_mpeuler(i))/2)
    
end
%}
%  
%  for j=1:15
%      h=10^(1-j)
for i=1:N
    %Update
%     x_euler(i+1)=x_euler(i)+ h*fx1(x_euler(i),t(i));

  x_euler(i+1)=x_euler(i)+ h*((randn*var)/(m*gamma) - g/(gamma)^2);
    
  if x_euler(i+1)<0
       x_euler(i+1)=0-x_euler(i+1);
    elseif x_euler(i+1)>1
         x_euler(i+1)=2-x_euler(i+1);
    end

%     k1_mpeuler=h*fx1(x_mpeuler(i),t(i));
%     k2_mpeuler=h*fx1(x_mpeuler(i)+k1_mpeuler/2,t(i)+h/2);
%     x_mpeuler(i+1)=x_mpeuler(i)+ k2_mpeuler;

%     k1_impeuler=h*fx1(x_impeuler(i),t(i));
%     k2_impeuler=h*fx1(x_impeuler(i)+k1_impeuler,t(i)+h);
%     x_impeuler(i+1)=x_impeuler(i)+0.5*(k1_impeuler+k2_impeuler);
    
end
% % figure
% % subplot(2,2)

% % plot(t,x1)
% % hold on
% % pause(5)
% figure
% plot(t,x_euler)
figure
hist(x_euler,100)
% % hold on
% % plot(t,x_mpeuler)
% % hold on
% % plot(t,x_impeuler)

%  sth(j)=h
%  end
%  
 
 