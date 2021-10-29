function [p]=P_ij(i,j,N1,N2,fa)
% Determines Pij for jth charge and ith contour point
d1=3/(N1+1);
a2=fa*d1;
if i<=N1+N2
    [xi,yi,zi,xj,yj,zj]=cord(i,j,N1,N2,fa);
    %for i=1 to i=N1+2N2
else
    [xi,yi,zi,xj,yj,zj]=cord(i-N2,j,N1,N2,fa);
    %for i=N1+N2 to i=N1+2N2
end
r1=sqrt((xi-xj)^2+(yi-yj)^2+(zi-zj)^2)/100;
%r1 in metre
r2=sqrt((xi-xj)^2+(yi+yj)^2+(zi-zj)^2)/100;
%r2 in metre
if i<=N1
    p=(1/(4*pi))*(1/r1-1/r2);
elseif i<=N1+N2 && j<=N1+N2
    p=(1/(4*pi))*(1/r1-1/r2);
elseif i<=N1+N2 && j>N1+N2
    p=-(1/(4*pi))*(1/r1-1/r2);
else
    f=((xi-xj)/(4*pi))*((1/((r1)^3))-(1/((r2)^3)));
    if j<=N1
        r1=sqrt((xi-xj)^2+(yi-(yj+1-2*a2))^2+(zi-zj)^2)/100;
        %r1 in metre
        r2=sqrt((xi-xj)^2+(yi+(yj+1-2*a2))^2+(zi-zj)^2)/100;
        %r2 in metre
        f=f+((xi-xj)/(4*pi))*((1/((r1)^3))-(1/((r2)^3)));
        %Electrode charge at upper portion taken
        p=5*f; %(er-1)=5
    elseif j<=N1+N2
        p=-f;
    else
        p=6*f; %er=6
    end
end
if i<=N1+N2 && j<=N1
    r1=sqrt((xi-xj)^2+(yi-(yj+1-2*a2))^2+(zi-zj)^2)/100;
    %r1 in metre
    r2=sqrt((xi-xj)^2+(yi+(yj+1-2*a2))^2+(zi-zj)^2)/100;
    %r2 in metre
    p=p+(1/(4*pi))*(1/r1-1/r2);
    %Electrode charge at upper portion taken
end
% Pij and Fnij is in e*V/C
% e is permittivity
% er is relative permittivity(unitless)
end

function [xi,yi,zi,xj,yj,zj]=cord(i,j,N1,N2,fa)
% Determines coordinates for jth charge and ith contour point
d1=3/(N1+1);
d2=10/(N2+1);
a2=fa*d1;
if i<=N1
    xi=d1+(i-1)*d1;
    yi=10;
    zi=0;
else
    xi=1;
    yi=d2+(i-N1-1)*d2;
    zi=0;
end
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
    