%% Fitting the bell curve on noramlly distributed data
clear all
clf
n = randn(5000,1);
%to plot graphs for a sample normally distributed data
subplot(2,2,1)
bar(n)
title('Gaussian Noise')
std(n)

mean(n)

subplot(2,2,2)
histogram(n,'Normalization','pdf')
hold on
y = -5:0.1:5;
mu = 0.0084;
sigma = 0.9884;
f = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
plot(y,f,'LineWidth',1.5)
title('Histogram')
ylabel('Counts')

hold off