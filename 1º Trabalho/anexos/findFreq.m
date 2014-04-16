function x = findFreq(freq,CK,N)
subir = 0;
x = zeros(1,N);
j=1;
for i = round((length(CK)/2))+1:1:length(CK)
    if(subir==0 && CK(i)>CK(i-1))
        subir=1;
    end
    if(subir==1 && CK(i)<CK(i-1))
       subir = 0;
       x(j) = freq(i-1);
       j = j+1;
    end
end
return