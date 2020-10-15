%% Plotting the frequency component of 10 parts of a signal
[s fs] = audioread('s1 (1).wav');

x = s(:,1);
signal_chunk = [0, zeros(1,length(x))];

Nyquist = fs/2;
N = length(x)-1;
fbin = -fs/2:fs/4009:fs/2;

clf
n = length(x)/11;
for i = 1: 10
    start = i*n;
    final = start+n;
    signal_chunk = x(start:final);
    X = fft(signal_chunk);
    
    
    %subplot(2,5,i)
    plot(db(abs((X))) + i*100)
    hold on 
    
    %subplot(5,2,i)
    %plot(fbin,db(abs(fftshift(X)) + i*50))
    %hold on
    %ylabel('Fourier transform in dB')
    xlabel('Frequency')
    legend('Part 1 ','Part 2 ','Part 3 ','Part 4 ','Part 5 ','Part 6','Part 7','Part 8','Part 9','Part 10')
    %title(sprintf('Part %d of the signal',i))    
end

% We can see how the value of the frequency component is
% increasing in every part that means the oscillations of the source
% are getting faster as time (duration of the signal) is progressing.

%% plotting the fourier transform (frequency components) as an image

clf
for i = 1:10
    start = i*n;
    final = start+n;
    signal_chunk = x(start:final);
    X = fft(signal_chunk);
    
    
    subplot(2,5,i)
    image(db(abs(fftshift(X))))
    ylabel('Frequency')
    title(sprintf('Part %d',i))
    %hold on
end

