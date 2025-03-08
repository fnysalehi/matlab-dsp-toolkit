# Sample Data

This directory should contain audio files for testing the DSP toolkit.

## Test Files
You can use any of the following:
1. Your own audio files (.mp3, .wav)
2. Generated test signals using the `generate_signals.m` function
3. Download royalty-free samples from:
   - [Free Sound](https://freesound.org/)
   - [BBC Sound Effects](https://sound-effects.bbcrewind.co.uk/)

## Example Usage
```matlab
% Using your own audio file
[signal, Fs] = audioread('your_audio_file.mp3');

% Or using generated test signals
sr = 44100;  % Standard audio sample rate
frequencies = [440, 880];  % A4 and A5 notes
duration = 2;  % seconds
test_signal = generate_signals(sr, duration, frequencies);
```