function [modulated, demodulated] = am_modulator(signal, sr, carrier_freq)
    % Perform AM modulation and demodulation
    % Parameters:
    %   signal: Input signal
    %   sr: Sample rate
    %   carrier_freq: Carrier frequency
    
    T = 1/sr;
    t = (0:length(signal)-1)*T;
    carrier = sin(2*pi*carrier_freq*t);
    
    % Modulation
    modulated = signal .* carrier;
    
    % Demodulation
    demodulated = modulated .* carrier;
    
    % Low-pass filtering
    fc = carrier_freq/2;
    Wn = (2/sr)*fc;
    filter_order = 40;
    b = fir1(filter_order, Wn, 'low', kaiser(filter_order+1, 3));
    demodulated = filter(b, 1, demodulated);
end