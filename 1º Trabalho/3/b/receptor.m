function ret = receptor(x, Tb, A, f)

chaves = 'abcdefghijklmnopqrstuvwxyz ';
valores = {[0 1],[1 0 0 0],[1 0 1 0],[1 0 0], 0 ,[0 0 1 0],[1 1 0],[0 0 0 0],[0 0],[0 1 1 1],[1 0 1],[0 1 0 0],[1 1],[1 0],[1 1 1],[0 1 1 0],[1 1 0 1],[0 1 0],[0 0 0],1,[0 0 1],[0 0 0 1],[0 1 1],[1 0 0 1],[1 0 1 1],[1 1 0 0],[1 0 0 1 0]};
aux = [];
z = 0;
w = 0;
ret= [];
t = 0: Tb/99: Tb;
bit1 = (A * cos (2 * pi * f * t)); 
bit0 = (A * cos (2 * pi * f * t + pi));
nBits = length(x) / 100;
for i = 1 : nBits
    for j = 1 : 100
        z = z+ (x((i-1)*100+j) - bit0(j));
    end
    if z == 0
        aux= [aux 0];
    else
    for j = 1 : 100
        w = w+ (x((i-1)*100+j) - bit1(j));
    end
    if w == 0
        aux = [aux 1];
    else
        for c = 1 : length(valores)
            valoresl = length(valores(c));
            auxl = length(aux);
            if length(aux) == length(cell2mat(valores(c)))
                if aux == cell2mat(valores(c))
                    ret = [ret chaves(c)];
                    aux = [];
                    break
                end
            end
        end
    end
    end
    z = 0;
    w = 0;
end  
return