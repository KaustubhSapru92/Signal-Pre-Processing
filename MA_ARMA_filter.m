clear all
clf
L = 100;
Q = 4;

x = randn(1,L);
h = randn(1,Q);

%x = [1 2 3 4];
%h = [1 1 1];

subplot(5,2,1);
plot(x)
xlabel('n values')
ylabel('Amplitude')
title('x(n)')

subplot(5,2,2);
stem(h)
xlabel('n values')
ylabel('Amplitude')
title('h(n)')
%% 'full' implementation of MA filter using for loop
conv(x,h)

X = [x,zeros(1,length(x))];
H = [h,zeros(1,length(x))];

%y_MA = zeros(size(x)+1)
for n = 1:(length(x)+length(h)-1)
    y(n) = 0; 
    for k = 1:length(x)
        if (n-k+1)>0
            y(n) = y(n) + X(k)*H(n-k+1);
        end
    end
end
subplot(5,2,3);
plot(y)
xlabel('n values')
ylabel('Amplitude')
title('y - full MA filter')

%% 'valid' implementation of MA filter using for loop
clear y 
conv(x,h,'valid')

X = [x,zeros(1, length(x))];
H = [h, zeros(1,length(x))];

for n = 1:(length(x)-length(h)+1)
    y(n) = 0;
    for k = 1:length(x)
        if (k-n+1)>0
            y(n) = y(n) + X(k)*H(k-n+1);
        end
    end
end


subplot(5,2,4);
plot(y)
xlabel('n values')
ylabel('Amplitude')
title('y - valid MA filter')

% %% plotting the different outputs
% hold on
% subplot(2,2,3);
% stem(y)
% xlabel('n values')
% ylabel('Amplitude')
% title('y - output(n)')
% %hold off

%% implementing MA filter with 'filter()' function
y_F = filter(h,1,x); %does convolution only for valid values
subplot(5,2,5)
plot(y_F)
xlabel('n values')
ylabel('Amplitude')
title('output(n) using filter()')

%% implementing MA filter with Teoplitz Matrix
Q = 3;
X = toeplitz(x,[x(1) zeros(1,Q)]); 
y_T = X*h';

subplot(5,2,6)
plot(y_T)
xlabel('n values')
ylabel('Amplitude')
title('output(n) using Teoplitz Matrix')

%% implementing MA filter using Conv() function
y_C = conv(h,x,'full');
y_V = conv(x,h,'valid');

subplot(5,2,7)
plot(y_C)
xlabel('n values')
ylabel('Amplitude')
%title('output(n) using Conv()-full')

hold on
subplot(5,2,7)
plot(y_V)
xlabel('n values')
ylabel('Amplitude')
title('output(n) using Conv()-Valid/full')
hold off

%% filter() function implementation of ARMA filter
a = [1,0.75, 0.5];  % coefficients of the AR filter

% filter(MA_coefficients, AR_coefficients , input)
y_filter = filter(h,a,x);

%% for loop implementation of ARMA filter
Q = length(h);
P = length(a);

y = zeros(size(x));
for n=1:length(x) % for all output samples 
    % MA model
    for k=1:Q % sum over Q delays 
        if n-k+1>0 % handle the starting edge
            y(n) = y(n) + h(k)*x(n-k+1);
        end
    end
    % AR model
    for k = 2:P
        if n-k+1>0
            y(n) = y(n) - a(k)*y(n-k+1);    
        end      
    end
end
%% Plotting the outputs
clc
% subplot(5,2,8)
% plot(x)
% xlabel('Samples')
% ylabel('Amplitude')
% title('x(n)')
subplot(5,2,10)
plot(y_filter)
xlabel('Samples')
ylabel('Amplitude')
%title('ARMA - filter()')
hold on
plot(y)
xlabel('Samples')
ylabel('Amplitude')
title('ARMA - filter/for loop')
hold off
subplot(5,2,8)
stem(a)
title('AR coefficients')
xlabel('Samples')
ylabel('Amplitude')