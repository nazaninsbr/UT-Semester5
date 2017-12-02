m = 61;
Zn = randn(1, m);
n = [0:1:60];
Sn = 5*sin((2*pi*n)/20 + 3);
Xn = Sn + Zn;




stem(Xn);
title('Noisy Signal');
xlabel('n');
ylabel('x[n]');