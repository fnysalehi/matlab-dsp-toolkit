% Modulation and Signal Processing Demo
clear all; close all; clc;

% Add paths
addpath('../src/signals');
addpath('../src/modulation');
addpath('../src/analysis');

% Generate test signal
sr = 10000;
frequencies = [1000, 2000, 4200];
signal = generate_signals(sr, 1.5, frequencies);

% Perform modulation
[modulated, demodulated] = am_modulator(signal, sr, 2000);

% Analyze spectra
[freq1, mag1] = spectrum_analyzer(signal, sr);
[freq2, mag2] = spectrum_analyzer(modulated, sr);
[freq3, mag3] = spectrum_analyzer(demodulated, sr);

% Plot results
figure('Name', 'Modulation Analysis');
subplot(3,1,1); plot(freq1, abs(mag1)); title('Original Signal Spectrum');
subplot(3,1,2); plot(freq2, abs(mag2)); title('Modulated Signal Spectrum');
subplot(3,1,3); plot(freq3, abs(mag3)); title('Demodulated Signal Spectrum');