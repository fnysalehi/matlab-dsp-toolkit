
close all; clear all;clc;
sr = 10000; %sample rate
T=1/sr; %sample period
L=1500; % length of signal
t=(0:L-1)*T; % time vector
om1=2000;om2=1000;om3=4200; % frequency of signal
%x1 = sin(2*pi*om3*t);
x1=sin(2*pi*om1*t)+sin(2*pi*om2*t)+sin(2*pi*om3*t);
%subplot(2,1,1);
 %plot(t,x1);
 %axis([0 0.005 -2.5 2.5])
%xlabel('Time (sec)')
%ylabel('Amplitude') 
%title('sin Wave')
y1 = fft(x1); % fast fourier transform
f = (0:length(y1)-1)*sr/length(y1);% frequency
%plot(f,abs(y1));
%title('Magnitude');
n = length(x1);                         
fshift = (-n/2:n/2-1)*(sr/n);
yshift = fftshift(y1);
%plot(fshift,abs(yshift));
%title('FFT of sum of three signals' );
%xlabel('shifted frequency');
%ylabel('Amplitude');


%Filter
fc = 3000; %cutoff frequency
Wn = (2/sr)*fc;
b = fir1(20,Wn,'low',kaiser(21,3));
fvtool(b,1,'Fs',sr)

y = filter(b,1,x1); %filtered signal
plot(t,x1,t,y)
xlim([0 0.005])
xlabel('Time (s)')
ylabel('Amplitude')
legend('Original Signal','Filtered Data')

y2 = fft(y); % FFT of filtered signal
f1 = (0:length(y2)-1)*sr/length(y2);
n = length(x1);                         
fshift = (-n/2:n/2-1)*(sr/n);
yshift = fftshift(y2);
plot(fshift,abs(yshift));
title('FFT of LP filtered signal' );

z = downsample(y,2);
