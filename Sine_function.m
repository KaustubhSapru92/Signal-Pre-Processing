%% To plot the harmonics of a sine function
clear all 
fs = 1000
dt = 1/fs;
t = 0 : 1/fs :1;

f= 10
phase = 2*pi*f*t;

y = sin(phase);

subplot(2,3,1)
plot(t,y)
title('Sine')

subplot(2,3,2)
a = -1:0.001:1;
plot(a,atan(a))
title('Squashing Non-Linearity')

subplot(2,3,3)
plot(t, atan(sin(phase)))
title('Squashed Sine')

subplot(2,3,4)
periodogram(sin(phase), [], [], fs)

subplot(2,3,6)
periodogram(atan(sin(phase)), [], [], fs)