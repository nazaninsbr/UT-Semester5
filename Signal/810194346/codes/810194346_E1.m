x1 = [1, 2, 0, -1, 3, -1, 0, 0, 0, 0];
x2 = [0, 0, 1, 2, 0, -1, 3, -1, 0, 0];
n = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
h = [2, 0, 2, 0, 0, 0, 0, 0, 0, 0];

y1 = conv(x1, h);
y2 = conv(x2, h);

figure;

subplot(n, n, y1);
stem(y1);
xlabel('n');
ylabel('Y1[n] = x[n]*h[n]');

subplot(n, n, y2);
stem(y2);
xlabel('n');
ylabel('Y2[n] = x[n-2]*h[n]');
