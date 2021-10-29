function [errorE,eE1,eE2,errorD,eD]=Vtest(Q,N1,N2,fa)
errorE=zeros(2,N1+1);
errorD=zeros(1,N2+1);
eE1=0;
eE2=0;
eD=0;
d1=3/(N1+1);
x=d1/2;
for i=1:N1+1
    errorE(1,i)=((Ve(x,10,0,Q,N1,N2,fa)-120*(10^3))*100)/(120*(10^3));
    eE1=eE1+errorE(1,i)^2;
    errorE(2,i)=((Ve(x,11,0,Q,N1,N2,fa)-120*(10^3))*100)/(120*(10^3));
    eE2=eE2+errorE(2,i)^2;
    x=x+d1;
end
eE1=sqrt(eE1/(N1+1));
eE2=sqrt(eE2/(N1+1));
d2=10/(N2+1);
y=d2/2;
for i=1:N2+1
    [errorD(1,i)]=Vd_err(y,Q,N1,N2,fa);
    eD=eD+errorD(1,i)^2;
    y=y+d2;
end
eD=sqrt(eD/(N2+1));
end