% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: D. Wijaya, et. al. 2018. Forward modeling metode SP. http://doi.org/10.5281/zenodo.1187020

clear; close; clc;
%Konstanta
K = -600;
z = 20;
x0 = 0;
teta = 40;

%Lokasi Pengukuran
x = -100:10:100;

%%----------- Formula Forward Cylinder ---------%%
for i = 1:length (x)
    V(i) = ((x(i)-x0)*cosd(teta)+z*sind(teta))/(((x(i)-x0)^2+z^2));
end

dy = K*V;

%%--------- Plot Forward --------%%
figure(1)
subplot(5,1,[1 2])
plot(x,dy,'.','color','r','Markersize',15);
xlim([min(x) max(x)]);
xlabel('\bf \fontsize{12}\fontname{Times}Posisi (m)');
ylabel('\bf \fontsize{12}\fontname{Times}\Delta g (mGal)');
title('\bf \fontsize{14}\fontname{Times}Modeling SP - Silinder Horisontal');

subplot(5,1,[4 5])
% Gambar Silinder Horisontal
th = 0:pi/50:2*pi;
R = 10;
xunit = R*cos(th)+x0;
yunit = R*sin(th)+z;
fill(xunit,yunit,'r');
set(gca,'ydir','reverse');
axis([min(x) max(x) 0 50]);
title([ ' \bf \fontsize{14} \fontname{Times}Model => ' , ' K = ' , ...
 num2str(K), ' kg/m^3 ; R = ' ,num2str(R), ...
 ' m ; z = ' ,num2str(z), ' m ; x_0 = ' ,num2str(x0), 'm' ]);
xlabel(' \bf \fontsize{12} \fontname{Times}Posisi (m)' );
ylabel(' \bf \fontsize{12} \fontname{Times}Kedalaman (m)' );
