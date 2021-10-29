function [Q]=PQ_V(N1,N2,fa)
P=zeros(N1+2*N2,N1+2*N2);
%P vector created and filled with zeroes
d1=3/(N1+1);
NA=0;
xNA=0;
for i=1:N1
    xNA=xNA+d1;
    if xNA<=1
        NA=NA+1;
    else
        break;
    end
end
        
for i=1:N1+2*N2
    for j=1:N1+2*N2
        if j<=N1
            if i>N1 && i<=N1+N2
                P(i,j)=0;
            else
                P(i,j)=P_ij(i,j,N1,N2,fa);
            end
        elseif j<=N1+N2
            if i<=NA
                P(i,j)=0;
            else
                P(i,j)=P_ij(i,j,N1,N2,fa);
            end
        else
            if i>NA && i<=N1
                P(i,j)=0;
            else
                P(i,j)=P_ij(i,j,N1,N2,fa);
            end
        end
    end
end
%P square matrix created. Values of P matrix do not contain e. So P_ij is
%in e*V/C.
% e is permittivity
V=zeros(N1+2*N2,1);
% Column matrix V filled with zeros
for i=1:N1
    % V column matrix created. 120*(10^3) represents 120KV electrode
    % voltage.
    V(i)=120*(10^3);
end
Q=P\V;
% So Q_j is in C/e
% e is permittivity
end