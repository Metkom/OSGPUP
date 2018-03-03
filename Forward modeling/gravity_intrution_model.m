% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Download: https://www.mathworks.com/matlabcentral/fileexchange/66294-forward-modeling-metode-gravity--intrution-model
% Cite: E.B.G. Umboh, et. al. 2018. Forward modelling metode gravitasi. http://doi.org/10.5281/zenodo.1186957 

clear; close; clc;
%--- Parameter Model (rho, R)
rho1 = 1;
rho2 = 1;% Perbedaan densitas (kg/m^3)

%--- Konstanta 
x0 = 50;
m = 30;
z = 100;
cGrav = 6.674e-11;  % Konstanta Gravitasi (m^3 kg^-1 s^-2)
si2mg = 1e5;        % 1 SI (ms^-2) = 1e5 mGal
%--- Lokasi Pengukuran
x = 0:2:100;

%%--- FORMULA FORWARD SQUARE 
k1 = cGrav*rho1;
for i = 1:length(x)
  a = (m/2)+(x(i)-x0);      % Jarak Ke P(x,0)
  b = (x(i)-x0)-(m/2);
  dg1(i) = k1*(a*log((a^2+z^2)/a^2)-(b*log((b^2+z^2)/b^2))+((2*z)*(atan(a/z)- atan(b/z))));
end

k2 = cGrav*rho2;
for i = 1:length(x)
  a2 = (m/2)+(x(i)-x0);      % Jarak Ke P(x,0)
  b2 = (x(i)-x0)-(m/2);
  dg2(i) = k2*(a2*log((a2^2+z^2)/a2^2)-(b2*log((b2^2+z^2)/b2^2))+((2*z)*(atan(a2/z)- atan(b2/z))));
end

%--- Forward modeling 1
dg1  = dg1*si2mg;  %1 SI = 1e5 mGal
dg2  = dg2*si2mg;  %1 SI = 1e5 mGal
x = [-z,(-z-20),(-z-20),-z];
y = [((x0/2)-(m/6)),((x0/2)-(m/6)),((x0/2)+(m/3)),((x0/2)+(m/3))];
x1 = [-z,(-z-20),(-z-20),-z];
y1 = [((x0/2)-(m/6)),((x0/2)-(m/6)),((x0/2)+(m/3)),((x0/2)+(m/3))];
figure(1)
subplot(3,1,1)
plot(dg1,'color','b')
hold on

subplot(3,1,1)
plot(dg2,'color','r')
xlabel('Posisi (m)')
ylabel('Delta g (mGal)')
title('Modeling Gravity - Intrusi')
hold off

subplot(3,1,2)
fill(y,x,'b')
xlim([0 60]);
ylim([-120 -50]);
xlabel('Posisi (m)')
ylabel('Kedalaman (m)')

subplot(3,1,3)
fill(y1,x1,'r')
xlim([0 60]);
ylim([-120 -50]);
xlabel('Posisi (m)')
ylabel('Kedalaman (m)')
