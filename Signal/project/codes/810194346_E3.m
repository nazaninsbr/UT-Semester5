clear;
close all;

Fs = 1000; 
T = 1/Fs;
L = 1000;
t = (0: L-1)*T;


St = 0.7*sin(2*pi*50*t) + sin(2*pi*360*t);
Xt = St + 2*randn(size(t));

subplot(4, 1, 1);
plot(1000*t(1:50), Xt(1:50));
title('Noisy Signal');
xlabel('t(millisecond)');
ylabel('x(t)');


Y = fft(Xt);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(4, 1, 2);
plot(f, P1);
title('Single-Sided Amplitude Spectrum of x(t)');
xlabel('f(Hz)');
ylabel('|P1(f)|');


Y2 = fft(St);
M2 = abs(Y2/L);
M1 = M2(1:L/2+1);
M1(2:end-1) = 2*M1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(4, 1, 3);
plot(f, M1);
title('Single-Sided Amplitude Spectrum of s(t)');
xlabel('f(Hz)');
ylabel('|M1(f)|');

Filtered_Signal = filter(Filter_Response, Xt);
Y3 = fft(Filtered_Signal);
G2 = abs(Y3/L);
G1 = G2(1:L/2+1);
G1(2:end-1) = 2*G1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(4, 1, 4);
plot(f, G1);
title('Filter Response');