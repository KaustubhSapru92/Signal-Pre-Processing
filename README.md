# Signal-Pre-Processing
Some basic techniques to pre-process signals for data extraction.

1.Sine_Function.m:
Here I demonstrate how to generate a sinosoid of a given frequency and time period. It's subsequent harmonics are plotted after intoducing a non-linearity.

2.Fitting the Bell Curve.m
Some code to fit a bell curve on normally distributed data ( mean ~ 0, sigma ~ 1). Also, a way to generate random normally distributed data and represent it using a histogram.

3.Noise_normalization.m
Here I take a natural signal ( you can take any signal ), where a window is created and each sample is divided by the standard deviation(sigma) to even out the noise in the signal.

4. Impulse response v Order.m
Taking the 2 channels of a stereo signal and using the Teoplitz matrix to calculate the impluse response using channel 1. Then regenerating channel 2 from the impulse response and seeing the difference between original channel 2 and the one synthesized from the impulse response. Also seeing how the synthesized channel 2 signal varies when the order of the Teoplitz matrix is increased.
