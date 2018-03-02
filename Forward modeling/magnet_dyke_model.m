% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: I. Nugroho, et. al. 2018. Forward modelling metode geomagnet. http://doi.org/10.5281/zenodo.1186988

clear; clc; close;

%Konstanta
k = 1;     %kontras kemagnetan(Tkm/H)
To = 1;     %intensitas magnet bumi

%Parameter yang ditentukan
a = 10;    %sudut dip slip (0-90 derajat)
b = 45;    %sudut inklinasi (0-90 derajat)
c = 45;    %sudut strike azimuth (0-90 derajat)
x = -100:100; %rentang Pengamatan (km)
m = 20;     %lebar lapisan (km)
Xo = 5;     %lokasi objek 
z = 10;    %kedalaman (km)

%Rumus magnetik
Io = atand(b);
Q = Io-a;
P = (2*k*To*m*(1-(cosd(b))^2*(sind(c))^2)^0.5);

for i = 1:length(x)
    M(i)=P*((x(i)-Xo)*sind(Q)+z*cosd(Q))/((x(i)-Xo)^2+z^2);
end

%Kurva medan magnetik
figure(1)
subplot(5,1,[1 2])
plot(x,M,'.','color','b','markersize',15);
xlim([min(x) max(x)]);
xlabel('\bf\fontsize{12}\fontname{times}posisi (km)');
ylabel('\bf\fontsize{12}\fontname{times}\delta B (nT)');
title('\bf\fontsize{12}\fontname{times}Modeling Magnetik-Dyke');

%Gambar objek dibawah tanah
X = [Xo+m/2,Xo+50/tand(a)+m/2,Xo+50/tand(a)-m/2,Xo-m/2];
Y = [z,z+50,z+50,z];
subplot(5,1,[4 5])
fill(X,Y,'b');
xlim([x(1) x(end)]);
ylim([0 (z+50)]);
set(gca,'ydir','reverse');
xlabel('\bf\fontsize{12}\fontname{times}posisi (km)');
ylabel('\bf\fontsize{12}\fontname{times}Kedalaman (km)');
title('\bf\fontsize{12}\fontname{times}Modeling Magnetik-Dyke');
