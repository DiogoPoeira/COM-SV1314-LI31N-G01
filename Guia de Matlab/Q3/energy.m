%
% ISEL - Instituto Superior de Engenharia de Lisboa.
%
% LEIC - Licenciatura em Engenharia Informatica e de Computadores.
%
% Com  - Comunicações.
%
%
% energy.m
% Esta função calcula a energia de um ficheiro wav.
function E = energy(filename)
y = file2vector( filename );
E = sum(y.*y);
end