% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: L.N. Hidayat, et. al. 2018. Band pass filter untuk data seismik. http://doi.org/10.5281/zenodo.1186472 

close; clear; clc;
 
% Input Data
N = input('Masukkan banyak trace: ');
data = ReadSegy('Bla-bla.sgy'); %Membaca Data Seismik
t = [0:500]*0.004;  %Rentang Waktu
 
% Analisis Spektrum Menggunakan FFT
y = data(:,N);
m = sum(y,2);
Fs = 250;
LD = length(m);
YD = fft(m);
P2D = abs(YD/LD);
P1D = P2D(1:LD/2+1);
fD = Fs*(0:(LD/2))/LD;
figure(1)
plot(fD,P1D)
hold on
title ('Spektrum Analisis')
ylabel ('Amplitude')
xlabel ('Frekuensi (Hz)')
axis([min(fD) max(fD) min(P1D) max(P1D)])
 
% m dan n adalah batas frekuensi yang dimasukkan untuk bandpass filter
% Syarat m < n 
m = input('Masukkan batas frekuensi bawah = ');
n = input('Masukkan batas frekuensi atas = ');
 
% Plot Raw Data
figure(2)
for i = 1:N
    subplot(1,2,1)
    plot(data(:,i)+300*i,t,'k');
    set(gca,'Ydir','reverse');
    title ('Before Bandpass Filter')
    legend('Raw')
    ylabel('Time (s)')
    xlabel('Offset (m)')
    hold on
    axis([min(data(:,1)+300*1) max(data(:,i)+300*i) min(t) max(t)])
end
 
% Bandpass filter dan plotting hasil filter
for i = 1:N
    y = data(:,i);
    Fs = 250; %Frekuensi Sampling
    [b,a] = butter(2,[m n]/(Fs/2)); %Bandpass dengan Fungsi Butter
    yabp = filter(b,a,y);%Mendefinisikan Bandpass yang akan Ditampilkan
    subplot(1,2,2)
    plot(yabp+300*i,t,'k')%Plot Bandpass Filter
    set(gca,'Ydir','reverse');
    legend('band')
    title ('After Bandpass Filter')
    legend('Bandpass')
    ylabel ('Time (s)')
    xlabel ('Offset (m)')
    hold on
    axis([min(yabp+300*1) max(yabp+300*i) min(t) max(t)])
end

