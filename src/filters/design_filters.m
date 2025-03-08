function [lowpass_filter, highpass_filter] = design_filters(Fs, fc, filter_order)
    % Design both lowpass and highpass filters
    % Parameters:
    %   Fs: Sampling frequency
    %   fc: Cutoff frequency
    %   filter_order: Order of the filter
    
    Wn = (2/Fs)*fc;
    
    % Design lowpass filter
    lowpass_filter = fir1(filter_order, Wn, 'low', kaiser(filter_order+1, 3));
    
    % Design highpass filter
    highpass_filter = fir1(filter_order, Wn, 'high', kaiser(filter_order+1, 3));
end