%OSU griffinj

%one second, makes a fourier transform of that recording, and plots its
%frequency maginitude vs. frequency with an accurate frequency scale, and
%on the same figure, plot the time domain waveform.


%setup parameters
Fs = 44100;     %sample rate
T = 1/Fs;       %period
s = 1;          %1 second
L = Fs * s;     %length, number of samples
t = (0:L-1)*T;  %time vector

Larr = 0:1:L-1; %sample vector

Tarr = Larr/Fs; %time domain sample vector


%take recording
recorder = audiorecorder(Fs,16,1);

recordblocking(recorder,s);

record1 = getaudiodata(recorder);



%take fourier transfrom
record1FT = fft(record1);       %take fast fourier transform

shiftFT = fftshift(abs(record1FT));    %move right half to left.

fshift = (-L/2:L/2-1)*(Fs/L);   %center around 0




%plot time and frequency domain
figure;
subplot(2,1,1)
plot(Tarr,record1);
title("Time Domain Recording");
xlabel("Time (s)");
ylabel("Voltage (V)");
subplot(2,1,2)
plot(fshift,shiftFT);
title("Freq. Domain Magnitude");
xlabel("Freq. Index");
ylabel("MAGNITUDE");
