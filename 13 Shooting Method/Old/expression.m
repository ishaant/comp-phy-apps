function x_final= expression(E)

xL=trajectory1(E);

xR=trajectory2(E);


x_final=(xL(1)*xR(2)-xL(2)*xR(1));


end