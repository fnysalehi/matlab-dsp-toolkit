%PROBLEM 2
[signal,Fs]=audioread('JohnLennon-Imagine.mp3');
%sound(signal, Fs); %playing the audio
% % clear sound -> for stop

% FFT of audio
% y1 = fft(signal); % fast fourier transform
% f = (0:length(y1)-1)*sr/length(y1);% frequency
% n = length(signal);                         
% fshift = (-n/2:n/2-1)*(Fs/n);
% yshift = fftshift(y1);
% plot(fshift,abs(yshift));
% title('FFT of sum of previous signals' );
% xlabel('shifted frequency');
% ylabel('Amplitude');



% %low pass filter
% fc = 3000; %cutoff frequency
% Wn = (2/Fs)*fc;
% b = fir1(20,Wn,'low',kaiser(21,3));
% fvtool(b,1,'Fs',Fs)


%high pass filter
fc = 3000; %cutoff frequency
Wn = (2/Fs)*fc;
b = fir1(10,Wn,'high',kaiser(11,3));
fvtool(b,1,'Fs',Fs)

y = filter(b,1,signal); % filtered signal
sound(y,Fs); % playing filtered signal



