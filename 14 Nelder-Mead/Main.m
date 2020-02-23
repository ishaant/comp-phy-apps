for i=1:100
KbT(i)=0.1+i*0.1
end

for i=1:100
 m(i)=abs(Nelderm(5,KbT(i)))
end
plot(KbT,m)

