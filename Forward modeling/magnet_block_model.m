% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: I. Nugroho, et. al. 2018. Forward modelling metode geomagnet. http://doi.org/10.5281/zenodo.1186988

clear; clc; close;

%Konstanta
Uo = 1.26*10^3; % Permeabilitas magnet di ruang hampa (H/km)
phi = 3.14;

%Parameter yang ditentukan
Mz = 1; % kontras magnetisasi (TKm/H)
z1 = 2.5; % kedalaman terhadap sisi atas obyek (km)
z2 = 10;  % kedalaman terhadap sisi bawah obyek (km)
x = -100:100; %rentang Pengamatan (km)
m = 25;     %lebar lapisan (km)
Xo = 10;     %lokasi objek (km)

%Rumus magnetik diberbagai titik
for i = 1:length(x)
    a1 = atan((x(i)-Xo+m)/z1);
    a2 = atan((x(i)-Xo-m)/z1);
    a3 = atan((x(i)-Xo+m)/z2);
    a4 = atan((x(i)-Xo-m)/z2);
    
    Bz(i) = Uo*Mz*((a1-a2)-(a3-a4))/(2*phi);
end

%Kurva medan magnetik
figure(1)
subplot(5,1,[1 2])
plot(x,Bz,'.','color','b','markersize',15);
xlim([min(x) max(x)]);
xlabel('\bf\fontsize{12}\fontname{times}Posisi (km)');
ylabel('\bf\fontsize{12}\fontname{times}\delta B (nT)');
title('\bf\fontsize{12}\fontname{times}Modeling Magnetik-Block');

%Gambar objek dibawah tanah
X = [Xo-m,Xo+m,Xo+m,Xo-m];
Y = [z1,z1,z2,z2];

subplot(5,1,[4 5])
fill(X,Y,'b');
xlim([x(1) x(end)]);
ylim([0 30]);
set(gca,'ydir','reverse');
xlabel('\bf\fontsize{12}\fontname{times}Posisi (km)');
ylabel('\bf\fontsize{12}\fontname{times}Kedalaman (km)');
title('\bf\fontsize{12}\fontname{times}Modeling Magnetik-Block');
