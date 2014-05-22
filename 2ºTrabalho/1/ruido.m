function t = ruido(x, SNe)
r = randn(1, length(x));
E = r.*r;
r = r * sqrt( SNe /E );
t = x + r;
plot(t, x);
end
