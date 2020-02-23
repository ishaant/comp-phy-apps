A=[5,8,4,5;8,4,3,1;4,3,6,2;5,1,2,7];    %Matrix


%Max Eigen Value

tol=0.001;
[a,avector,count]=eigenmax(A,tol)

%Min Eigen Value
tol=0.001;
[b,bvector,count]=eigenmin(A,tol)


%Refine
tol=0.0001;
root=-4.2;
[rv,rvector,count]=refine(A,root,tol)
