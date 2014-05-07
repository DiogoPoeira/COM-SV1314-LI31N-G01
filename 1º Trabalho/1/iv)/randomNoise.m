function randomNoise(n, e)
x = (rand(1,n));
E = x* x';
x = x * sqrt(e / E );
wavplay(x);
plot(x);
end