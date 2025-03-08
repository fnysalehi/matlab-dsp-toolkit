% Audio Processing Demonstration
clear all; close all; clc;

% Add paths
addpath('../src/filters');
addpath('../src/analysis');

% Load audio file
[signal, Fs] = audioread('../data/JohnLennon-Imagine.mp3');

% Design filters
[lp_filter, hp_filter] = design_filters(Fs, 3000, 20);

% Apply high-pass filter
filtered_signal = filter(hp_filter, 1, signal);

% Analyze spectrum
[freq, magnitude] = spectrum_analyzer(filtered_signal, Fs);

% Visualize results
figure('Name', 'Audio Signal Analysis');

subplot(2,1,1);
plot(freq, abs(magnitude));
title('Frequency Spectrum of Filtered Audio');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2,1,2);
plot(signal);
hold on;
plot(filtered_signal);
title('Time Domain Comparison');
legend('Original', 'Filtered');
xlabel('Sample');
ylabel('Amplitude');

% Save results
savefig('audio_analysis_results.fig');