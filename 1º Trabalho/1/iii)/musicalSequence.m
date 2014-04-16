function musicalSequence(f, d, N) % f = frequencia, d = duração em segundos, N = número de notas músicais
    
    n = 1 : 1 : f*d;
    Fs= 4000;
    for i=1 : N       
        W = 2*pi*(f/Fs);
        Signal = cos( W * n );
        wavplay( Signal, Fs );
        f = f * power(2,1/12);
        wavplay( zeros(1, round((Fs*n)/10)), Fs );
    end
end