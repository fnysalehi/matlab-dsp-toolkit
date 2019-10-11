
close all; clear all;clc;

sr = 10000; %sample rate
T=1/sr; %sample period
L=5; % length of signal
t=(0:L-1)*T; % time vector
om1=200;om2=2000;om3=4200; % frequency of signal
x = sin(2*pi*om1*t);
p = sin(2*pi*om2*t);
a = x.*p;
%a = 1/2 *(cos(2*pi*t*(om2-om1))-cos(2*pi*t*(om1+om2)));
y1 = fft(a); % fast fourier transform
f = (0:length(y1)-1)*sr/length(y1);% frequency
%plot(f,abs(y1));
%title('Magnitude');
n = length(a);                         
fshift = (-n/2:n/2-1)*(sr/n);
yshift = fftshift(y1);
%plot(fshift,abs(yshift));
%title('FFT of a(t)' );
%xlabel('shifted frequency');
%ylabel('Amplitude');


q = sin(2*pi*om2*t);
b = a.*q;
y2 = fft(b); % fast fourier transform
f2 = (0:length(y2)-1)*sr/length(y2);% frequency
%plot(f2,abs(y2));
%title('Magnitude');
n2 = length(b);                         
fshift2 = (-n2/2:n2/2-1)*(sr/n2);
yshift2 = fftshift(y2);
%plot(fshift2,abs(yshift2));
%title('FFT of sum of b(t)' );
%xlabel('shifted frequency');
%ylabel('Amplitude');


%Filter
fc = 200; %cutoff frequency
Wn = (2/sr)*fc;
o = fir1(40,Wn,'low',kaiser(41,3));
%fvtool(o,1,'Fs',sr)

c = filter(o,1,b); %filtered signal
%plot(t,b,t,c)
%xlim([0 5])
%xlabel('Time (s)')
%ylabel('Amplitude')
%legend('Original Signal','Filtered Data')

y2 = fft(c); % FFT of filtered signal
f1 = (0:length(y2)-1)*sr/length(y2);
n = length(c);                         
fshift = ((-n/2:n/2-1)*(sr/n))+1000;
yshift = fftshift(y2);
plot(fshift,abs(yshift));
title('FFT of filtered signal' );

