function [freq_shift, magnitude] = spectrum_analyzer(signal, Fs)
    % Perform FFT analysis on the input signal
    % Parameters:
    %   signal: Input signal
    %   Fs: Sampling frequency
    
    y = fft(signal);
    n = length(signal);
    freq_shift = (-n/2:n/2-1)*(Fs/n);
    magnitude = fftshift(y);
end