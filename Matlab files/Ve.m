function [v]=Ve(x,y,z,Q,N1,N2,fa)
if x<0 || x>3 || y<10 || y>11 || z~=0
    fprintf("(%f,%f,%f) is not a valid point. It does not lie on electrode\n",x,y,z);
elseif x<=1 && y==10
    d1=3/(N1+1);
    a2=d1*fa;
    v=0;
    for j=1:N1+2*N2
        if j<=N1 || j>N1+N2
        [xj,yj,zj]=mono_cord(j,N1,N2,fa);
        r1=sqrt((x-xj)^2+(y-yj)^2+(z-zj)^2)/100;
        %r1 in metre
        r2=sqrt((x-xj)^2+(y+yj)^2+(z-zj)^2)/100;
        %r2 in metre
        p=(1/(4*pi))*(1/r1-1/r2);
        v=v+p*Q(j);
        end
    end
    for j=1:N1
        [xj,yj,zj]=mono_cord(j,N1,N2,fa);
        r1=sqrt((x-xj)^2+(y-(yj+1-2*a2))^2+(z-zj)^2)/100;
        %r1 in metre
        r2=sqrt((x-xj)^2+(y+(yj+1-2*a2))^2+(z-zj)^2)/100;
        %r2 in metre
        p=(1/(4*pi))*(1/r1-1/r2);
        v=v+p*Q(j);
    end
elseif y==11 || (x>1 && y==10)
    d1=3/(N1+1);
    a2=d1*fa;
    v=0;
    for j=1:N1+N2
        [xj,yj,zj]=mono_cord(j,N1,N2,fa);
        r1=sqrt((x-xj)^2+(y-yj)^2+(z-zj)^2)/100;
        %r1 in metre
        r2=sqrt((x-xj)^2+(y+yj)^2+(z-zj)^2)/100;
        %r2 in metre
        p=(1/(4*pi))*(1/r1-1/r2);
        v=v+p*Q(j);
    end
    for j=1:N1
        [xj,yj,zj]=mono_cord(j,N1,N2,fa);
        r1=sqrt((x-xj)^2+(y-(yj+1-2*a2))^2+(z-zj)^2)/100;
        %r1 in metre
        r2=sqrt((x-xj)^2+(y+(yj+1-2*a2))^2+(z-zj)^2)/100;
        %r2 in metre
        p=(1/(4*pi))*(1/r1-1/r2);
        v=v+p*Q(j);
    end
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