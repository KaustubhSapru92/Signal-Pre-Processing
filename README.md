# Signal-Pre-Processing
Some basic techniques to pre-process signals for data extraction.

1.Sine_Function.m:
Here I demonstrate how to generate a sinosoid of a given frequency and time period. It's subsequent harmonics are plotted after intoducing a non-linearity.

2.Fitting the Bell Curve.m:
Some code to fit a bell curve on normally distributed data ( mean ~ 0, sigma ~ 1). Also, a way to generate random normally distributed data and represent it using a histogram.

3.Noise_normalization.m:
Here I take a natural signal ( you can take any signal ), where a window is created and each sample is divided by the standard deviation(sigma) to even out the noise in the signal.

4. Impulse response v Order.m:
Taking the 2 channels of a stereo signal and using the Teoplitz matrix to calculate the impluse response using channel 1. Then regenerating channel 2 from the impulse response and seeing the difference between original channel 2 and the one synthesized from the impulse response. Also seeing how the synthesized channel 2 signal varies when the order of the Teoplitz matrix is increased.

5. Poles_v_Impulse.m:
I demonstrate the relationship between poles in the z-domain and the respective associated impulse response. Sections of the code are to be run sequentially.

6. FFT_Chunks.m:
A signal can broken down into chunks (10 equal chunks) and the Fourier Transform of each chunk is plotted and a comparison is made. The signal I've chosen is a chirp where the frequency increases as the signal progresses in time. This is highlighted by Fourier Transform comparison of the chunks.

7.MA_ARMA_filter.m:
Taking a step back and implementing the Moving Average filter(Convolution) and Auto-Regressive Moving Average using the for loop (first principles). The output is then compared to the in built functions in matlab such as conv(), filter().

