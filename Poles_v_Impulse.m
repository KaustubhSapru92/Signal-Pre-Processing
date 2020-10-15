% plotting impluse response gives zeros and poles
clf
i = sqrt(-1);
%% first set of poles in quad 1 and 4 
z = [-2]
p = [0.5+0.5i, 0.5-i/2]
subplot(2,1,1)
zplane(z',p')
title('Poles in the 1st and 4th quadrant')
legend('zeros', 'poles')
%figure1 = zplane(z',p');

%z domain to time domain

b = poly(z);
a = poly(p);

if abs(roots(a)) > 1
    fprintf('H(z) is not stable, choose different poles\n')
    subplot(2,1,2)
    clf
else
    impulse =  [1; zeros(100, 1)];
    h1 = filter(b,a,impulse);
    subplot(2,1,2)
    plot(h1)
    xlabel('Samples')
    ylabel('Amplitude')
    title('Impulse response')

    %hold on
end


%% second set of poles in quad 2 and 3
clf
%i = sqrt(-1);
z = [1+0.5i, 1-0.5i];
p = [-0.5+0.1i,-0.5-0.1i] % conjugates
subplot(2,1,1)
zplane(z',p')
title('Poles in the 2nd and 3rd quadrant')
legend('zeros', 'poles')

%z domain to time domain

b = poly(z);
a = poly(p);

if abs(roots(a)) > 1
    fprintf('H(z) is not stable, choose different poles\n')
    subplot(2,1,2)
    clf
else
    impulse =  [1; zeros(100, 1)];
    h2 = filter(b,a,impulse);
    subplot(2,1,2)
    plot(h2)
    xlabel('Samples')
    ylabel('Amplitude')
    title('Impulse response')

    %hold on
end

%% third set of one pole in quadrant 1 
%i = sqrt(-1);
clf
z = [1,3,0.2-0.2i]
p = [0.2-0.2i] 
subplot(2,1,1)
figure3 = zplane(z',p')
title('Pole in the 1st quadrant')
legend('zeros', 'poles')
%z domain to time domain

b = poly(z);
a = poly(p);

if abs(roots(a)) > 1
    fprintf('H(z) is not stable, choose different poles\n')
    subplot(2,1,2)
    clf
else
    impulse =  [1; zeros(100, 1)];
    h3 = filter(b,a,impulse);
    subplot(2,1,2)
    plot(h3)
    xlabel('Samples')
    ylabel('Amplitude')
    title('Impulse response')
    %hold on
end

%% Fourth set of two conjugate poles outside unit circle
clf
z = [-0.3,-0.4]
p = [0.2-1.5i, 0.2+1.5i] 
subplot(2,1,1)
figure4 = zplane(z',p')
title('Poles outside the unit circle')
legend('zeros', 'poles')

%z domain to time domain

b = poly(z);
a = poly(p);

% if abs(roots(a)) > 1
%     fprintf('H(z) is not stable, choose different poles\n')
%     subplot(2,1,2)
%     %clf
% else
    impulse =  [1; zeros(100, 1)];
    h4 = filter(b,a,impulse);
    subplot(2,1,2)
    plot(h4)
    xlabel('Samples')
    ylabel('Amplitude')
    title('Impulse response')
    %hold on
% end

%% Plotting all the impulse responses
subplot(2,2,1)
plot(h1)
xlabel('Samples')
ylabel('Amplitude')
title('h - poles in quad 1 and 4')
subplot(2,2,2)
plot(h2)
xlabel('Samples')
ylabel('Amplitude')
title('h - poles in quad 2 and 3')
subplot(2,2,3)
plot(h3)
xlabel('Samples')
ylabel('Amplitude')
title('h - pole in quad 1 ')
subplot(2,2,4)
plot(h4)
xlabel('Samples')
ylabel('Amplitude')
title('h - poles outside unit circle')

