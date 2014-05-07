function x = numeroDeTelefone(sinal,Fs)
x = ['0' '0' '0' '0' '0' '0' '0' '0' '0'];
dimTecla = length(sinal)/9;
tecla = zeros(1,dimTecla);
freq = ((0 : 1 : dimTecla-1)*Fs / ( dimTecla )) - Fs/2;
for i=1:9
    for j=1:dimTecla
        tecla(j) = sinal((i-1)*3200 + j);
    end
    CK = fftshift( abs(fft(tecla)) );
    CK = CK/dimTecla;
    f = findMaxs(freq,CK);
    x(i) = descodificaTecla(f);
end
return

function t = descodificaTecla(f)
linha = [697 770 852 941];
coluna = [1209 1336 1477 1633];
l = 1;
c = 1;
aux = 1;
teclado = ['1' '2' '3' 'A' ; '4' '5' '6' 'B' ; '7' '8' '9' 'C' ; '*' '0' '#' 'D'];
for i = 1:4
    if i == 1
        aux = abs(linha(i)-f(1));
    end
    if aux > abs(linha(i)-f(1))
       aux = abs(linha(i)-f(1));
       l = i;
    end
end
for j = 1:4
    if j == 1
        aux = abs(coluna(j)-f(2));
    end
    if aux > abs(coluna(j)-f(2))
       aux = abs(coluna(j)-f(2));
       c = j;
    end
end
t = teclado(l,c);
return

function x = findMaxs(freq,CK)
subir = 0;
x = zeros(1,2);
max1 = 1;
max2 = 1;
j=1;
for i = round((length(CK)/2))+1:1:length(CK)
    if(subir==0 && CK(i)>CK(i-1))
        subir=1;
    end
    if(subir==1 && CK(i)<CK(i-1))
       subir = 0;
       if freq(i-1)<=1000
           if CK(max1)<CK(i-1)
               max1 = i-1;
           end
       else
            if CK(max2)<CK(i-1)
               max2 = i-1;
           end
       end
       j = j+1;
    end
end
x(1) = freq(max1);
x(2) = freq(max2);
return