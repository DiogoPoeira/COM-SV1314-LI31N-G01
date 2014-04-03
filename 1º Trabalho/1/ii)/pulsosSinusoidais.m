function x = pulsosSinusoidais(A,fo,phi,T,desloc)
to = 1/fo;
Ts = to/100;
t = -4*to+Ts:Ts:4*to;
dim = length(t);
dimPulso = round(T/Ts);
dimDesloc = round(desloc/Ts);
dimEsq=round(dim/2-dimPulso/2-dimDesloc);
dimDir=round(dim/2-dimPulso/2+dimDesloc);
if abs(dimDesloc)+dimPulso/2>dim/2;
    dimPulso = dimPulso - (abs(dimDesloc)+dimPulso/2-dim/2);
    if dimPulso<0
        dimPulso=0;
    end
    if dimDesloc<0
        dimDir = 0;
        dimEsq = floor(abs(dim-dimPulso));
    else
        dimDir = floor(abs(dim-dimPulso));
        dimEsq = 0;
    end
end
v = [zeros(1,dimEsq) ones(1,dimPulso) zeros(1,dimDir)];
x = A*cos(2*pi*fo*t+phi);
res = v.*x;
plot(t,res);
end