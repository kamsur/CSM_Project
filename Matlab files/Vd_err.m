function [errD]=Vd_err(y,Q,N1,N2,fa)
x=1;
z=0;
errD=0;
for j=N1+1:N1+N2
    [xj,yj,zj]=mono_cord(j,N1,N2,fa);
    r1=sqrt((x-xj)^2+(y-yj)^2+(z-zj)^2)/100;
    %r1 in metre
    r2=sqrt((x-xj)^2+(y+yj)^2+(z-zj)^2)/100;
    %r2 in metre
    p=(1/(4*pi))*(1/r1-1/r2);
    errD=errD+p*Q(j);
end
for j=N1+N2+1:N1+2*N2
    [xj,yj,zj]=mono_cord(j,N1,N2,fa);
    r1=sqrt((x-xj)^2+(y-yj)^2+(z-zj)^2)/100;
    %r1 in metre
    r2=sqrt((x-xj)^2+(y+yj)^2+(z-zj)^2)/100;
    %r2 in metre
    p=(1/(4*pi))*(1/r1-1/r2);
    errD=errD-p*Q(j);
end
end
function [xj,yj,zj]=mono_cord(j,N1,N2,fa)
%Co-ordinate of jth charge
d1=3/(N1+1);
d2=10/(N2+1);
a2=d1*fa;
if j<=N1
    xj=d1+(j-1)*d1;
    yj=10+a2;
    zj=0;
elseif j<=N1+N2
    xj=1-a2;
    yj=d2+(j-N1-1)*d2;
    zj=0;
else
    xj=1+a2;
    yj=d2+(j-N1-N2-1)*d2;
    zj=0;
end
%Co-ordinates in cm
end
    