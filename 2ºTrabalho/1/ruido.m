function t = ruido(x, SNe)
r = randn(1, length(x));
E = r*r';
r = r * sqrt( E / SNe );
t = x + r;
plot(t);
end
