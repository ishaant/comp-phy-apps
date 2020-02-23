timeelapsed=zeros(10,1);
n=timeelapsed;

for i=1:25
  n(i)=10+ceil(1.5^(i-1));
  disp(n(i));
  tic;
  gaussianelim(n(i));
  timeelapsed(i)=toc;
end
figure
plot(n,timeelapsed)
hold on
%% 

timeelapsed2=timeelapsed*0;
for i=1:25
  n(i)=10+ceil(1.5^(i-1));
  A=rand(n(i));
  temp=sum(sum(A));
  A=A+eye(n(i))*temp;
 
  B=rand(n(i),1);
%   disp(eigs(A, 1, 'lm'))
  disp(n(i));
  tic;
  jacobi_iter(A,B);
  timeelapsed2(i)=toc;
  disp('done')
end
plot(n,timeelapsed2)
clear A;