% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: S.R. Aisy, et. al. 2018. Spektrum data seismik sebagai fungsi kedalaman. http://doi.org/10.5281/zenodo.1186465

clear; clc; close;

[data,TraceHeaderInfo,SegyTraceHeaders,SegyHeader] = ReadSegy('seismic_stack.sgy');
clear TraceHeaderInfo, SegyTraceHeaders, SegyHeader;

for i = 1:5
    plot((data(:,i)+5000*i),[1:3001]*0.002,'b'); 
    title('Data Seismik');
    xlabel('Offset');
    ylabel('Time(ms)');
    ylim([0 3])
    set(gca,'YDir','reverse');
    hold on
end

% Memilih trace untuk analisa frekuensi
figure
data100 = data([1:1501],100);  %%select data-nth
subplot(2,2,1)
plot(data100,[0:1500]*0.002);
title('Data Seismik');
xlabel('Offset');
ylabel('Time(s)');
ylim([0 3])
set(gca,'YDir','reverse');

subplot(2,2,2)
plot(data100(500:800),[500:800]*0.002);
title('Data Seismik Dangkal');
xlabel('Offset');
ylabel('Time(s)');
ylim([1 1.6])
set(gca,'YDir','reverse');

subplot(2,2,3)
plot(data100(800:1200),[800:1200]*0.002);
title('Data Seismik Menengah');
xlabel('Offset');
ylabel('Time(s)');
ylim([1.6 2.4])
set(gca,'YDir','reverse');

subplot(2,2,4)
plot(data100(1200:1500),[1200:1500]*0.002);
title('Data Seismik Dalam');
xlabel('Offset');
ylabel('Time(s)');
ylim([2.4 3])
set(gca,'YDir','reverse');

% Memilih trace untuk analisa frekuensi
XA = data100(500:1500);
XS = data100(500:800);
XM = data100(800:1200);
XD = data100(1200:1500);

T = 0.002;
Fs = 1/T;
LA = length(XA);
YA = fft(XA);
P2A = abs(YA/LA);
P1A = P2A(1:LA/2+1);
fA = Fs*(0:(LA/2))/LA;

T = 0.002;
Fs = 1/T;
LS = length(XS);
YS = fft(XS);
P2S = abs(YS/LS);
P1S = P2S(1:LS/2+1);
fS = Fs*(0:(LS/2))/LS;

T = 0.002;
Fs = 1/T;
LM = length(XM);
YM = fft(XM);
P2M = abs(YM/LM);
P1M = P2M(1:LM/2+1);
fM = Fs*(0:(LM/2))/LM;

T = 0.002;
Fs = 1/T;
LD = length(XD);
YD = fft(XD);
P2D = abs(YD/LD);
P1D = P2D(1:LD/2+1);
fD = Fs*(0:(LD/2))/LD;

figure
% memilih trace untuk analisa frekuensi
subplot(2,2,1)
plot(fA,P1A) 
title('Spectrum All')
xlabel('f(Hz)')
ylabel('Amplitude')
axis([0 70 0 350])

subplot(2,2,2)
plot(fS(1:75),P1S(1:75)) 
title('Spectrum Dangkal')
xlabel('f(Hz)')
ylabel('Amplitude')
axis([0 70 0 350])

subplot(2,2,3)
plot(fM(1:75),P1M(1:75)) 
title('Spectrum Menengah')
xlabel('f(Hz)')
ylabel('Amplitude')
axis([0 70 0 350])

subplot(2,2,4)
plot(fD(1:75),P1D(1:75)) 
title('Spectrum Dalam')
xlabel('f(Hz)')
ylabel('Amplitude')
axis([0 70 0 350])

figure
% memilih trace untuk analisa frekuensi

plot(fA,P1A,'k',fS,P1S,'r',fM,P1M,'g',fD,P1D,'b') 
title('Spectrum Comparison')
xlabel('f(Hz)')
ylabel('Amplitude')
axis([0 70 0 350])
legend('all','shallow','middle','deep')

rA = [fA',P1A];
rS = [fS',P1S];
rM = [fM',P1M];
rD = [fD',P1D];

save -ascii rA100.txt rA
save -ascii rS100.txt rS
save -ascii rM100.txt rM
save -ascii rD100.txt rD
 
save('P1A.txt')

