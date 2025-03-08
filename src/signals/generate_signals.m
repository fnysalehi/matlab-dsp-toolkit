function signal = generate_signals(sr, duration, frequencies)
    % Generate a composite signal from multiple frequencies
    % Parameters:
    %   sr: Sample rate (Hz)
    %   duration: Signal duration (seconds)
    %   frequencies: Array of frequencies to include (Hz)
    
    T = 1/sr;
    L = duration * sr;
    t = (0:L-1)*T;
    
    signal = zeros(size(t));
    for freq in frequencies
        signal = signal + sin(2*pi*freq*t);
    end
end