%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
%
% Com  - Comunica��es.
%
%
% energy.m
% Esta fun��o calcula a energia de um ficheiro wav.
function E = energy(filename)
y = file2vector( filename );
E = sum(y.*y);
end