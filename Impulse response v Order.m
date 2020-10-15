clear all 
clc
[bird, fs] =  audioread('bird-stereo.wav');
T = length(bird)/fs;
t = 0: T/97251 : T;

x = bird(:,1); %input in microphone 1
y = bird(:,2); %input in microphone 2 

Q = input('Please enter the length of the impulse you would like to test : \n')

X = toeplitz(x,[x(1) zeros(1,Q)]);
hlse = X\y

%Q = numel(hlse) % length of impulse response

yest =  filter(hlse,1,x);

residual = y - yest;

subplot(2,2,1)
plot(t,x)
title('input - Mic2')
ylabel('Amplitude')
xlabel('Time (s)')

subplot(2,2,2)
plot(t,y)
ylabel('Amplitude')
xlabel('Time (s)')
hold on 
plot(t,residual)
title('output - Mic2 ')
legend('mic2', 'residual')
hold off

i = 0: T/Q : T;

subplot(2,2,3)
plot(i,hlse)
title('hlse vs time ')
xlabel('Time')
ylabel('hlse')



