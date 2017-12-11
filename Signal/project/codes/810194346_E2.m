clear;
close all;

m = 61;
Zn = randn(1, m);
n = [0:1:60];
Sn = [];
Xn = [];
Yn = zeros(1,61);
Yn2 = zeros(1,61);
Sn = 5*sin((2*pi*n)/20 + 3);
Xn = Sn + Zn;


subplot(4, 1, 1);
stem(Xn);
title('Noisy Signal');
xlabel('n');
ylabel('x[n]');

subplot(4, 1, 2);
stem(Sn);
title('Signal Without Noise');
xlabel('n');
ylabel('s[n]');

b = 0.2;
N2 = 10;
N = 3;


for j = 0:60
	for i = 0:N-1
        if((j-i)>=0)
            Yn(j+1) =(b.^i)*(Xn(j-i+1)) + Yn(j+1);
        end
    end
    Yn(j+1) = (1-b)/(1-(b.^N))*Yn(j+1);
end

for j = 0:60
	for i = 0:N2-1
        if((j-i)>=0)
            Yn2(j+1) =(b.^i)*(Xn(j-i+1)) + Yn2(j+1);
        end
    end
    Yn2(j+1) = (1-b)/(1-(b.^N2))*Yn2(j+1);
end


subplot(4, 1, 3);
stem(Yn);
title('EWMA N=3');
xlabel('n');
ylabel('Y[n]');


subplot(4, 1, 4);
stem(Yn2);
title('EWMA N=10');
xlabel('n');
ylabel('Y[n]');


