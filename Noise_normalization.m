%% Normalizing noise in natural signals (tong_emg)
clear all
load tong_emg.mat
clf

x = tong_emg

for i = 11:length(x)-10 
    s = std(x(i-10:i+10));
    y(i) = x(i)/s;
end

subplot(2,1,1)
plot(y)
title('Normalized Tongue Emg')

%bar(y);

subplot(2,1,2)
histogram(y,'Normalization','pdf')
std(y)

mean(y)

hold on
y = -4:0.1:4;
mu = -0.0042;
sigma = 0.9816;
f = exp(-(y-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
plot(y,f,'LineWidth',1.5)
title('Histogram(tong_emg Normalized)')
ylabel('Counts') 
hold off
