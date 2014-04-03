function x = nPeriods(A , Fo , phi , N)
to = 1/Fo;
t = (-N/2)*to:to/100:(N/2)*to;
x = A*cos(2*pi*Fo*t + phi);
plot(t,x);
grid on;
end