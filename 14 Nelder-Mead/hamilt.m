function H=hamilt(Y)
H=0;
h=0;
N=size(Y,1);

Y=[Y, Y];
Y=[Y;Y];


for i=1:N
    for j=1:N
    
        H=H-Y(i,j)*(Y(i,j+1)+Y(i+1,j)+h);

    end
end

end
