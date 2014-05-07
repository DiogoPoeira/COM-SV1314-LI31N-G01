function x = Emissor(simbolos,Tb,A,F)
codigo = CodificadorFonte(simbolos);
x = CodificadorCanal(codigo,Tb,A,F);
return

function codigo = CodificadorFonte(simbolos)
chaves = 'abcdefghijklmnopqrstuvwxyz ';
valores = {[0 1],[1 0 0 0],[1 0 1 0],[1 0 0], 0 ,[0 0 1 0],[1 1 0],[0 0 0 0],[0 0],[0 1 1 1],[1 0 1],[0 1 0 0],[1 1],[1 0],[1 1 1],[0 1 1 0],[1 1 0 1],[0 1 0],[0 0 0],1,[0 0 1],[0 0 0 1],[0 1 1],[1 0 0 1],[1 0 1 1],[1 1 0 0],[1 0 0 1 0]};
codigo = [];
for i = 1 : length(simbolos)
    for j = 1 : length(chaves)
        if lower(simbolos(i)) == chaves(j);
            codigo = [codigo cell2mat(valores(j)) -1];
            break;
        end
    end
end
return

function codigo = CodificadorCanal(codigoSimbolos,Tb,A,F)
t = 0 : Tb/99 : Tb;
codigo = zeros(1,length(codigoSimbolos)*100);
i = 1;
cosineForOne = (A*cos(2*pi*F*t));
cosineForZero = (A*cos(2*pi*F*t+pi));
for j = 1 : length(codigoSimbolos)
    if codigoSimbolos(j) == 1
        for k = 1 : length(cosineForOne);
            codigo(i) = cosineForOne(k);
            i = i +1;
        end
    else
        if codigoSimbolos(j) == 0
            for k = 1 : length(cosineForZero);
                codigo(i) = cosineForZero(k);
                 i = i +1;
            end
        else
                i = i +100;
        end
        
    end
end
return

