function sinusoide(a,p,f)
clc
to=1/f;
t = -2*to:to/100:2*to
x = a* cos((2*pi*f*t)+p)
plot(t,x)
grid on
return
