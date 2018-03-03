% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: M.F.R. Auly, et. al. 2018. Forward modelling metode IP. http://doi.org/10.5281/zenodo.1187228

clear; close; clc;
R = 18; 
H = 24; 
P = -30:1:30; 
x0 = 0; 

m1 = 1; m2 = 5;
m = m2-m1; 
r = H/R;
%Iterasi untuk apparent chargeability
for i = 1:length(P)
    xs = P(i)-x0;
    q = xs/R;      
    F = (r*r-q*q)/((r*r+q*q)^2);
    ma(i) = (m*F)/(2+m*(F-1));  
end

subplot(5,1,[1 2]) %Ploting kurva apparent chargeability
plot(P,ma,'-','color','b','MarkerSize',15);
xlim([min(P) max(P)]);       
xlabel('\bf \fontsize{12}\fontname{Times}Position (m)');          
ylabel('\bf \fontsize{12}\fontname{Times}Apparent Chargeability (%)');
title('\bf \fontsize{15}\fontname{Times}Modelling IP - Horizontal Cylinder');

subplot(5,1,[4 5]) %Ploting kurva model silinder horizontal
th = 0:pi/50:2*pi;
xunit = R*cos(th)+x0;
yunit = R*sin(th)+H;
fill(xunit,yunit,'b');
xlim([x0-r-100 x0+r+100]);
set(gca,'ydir','reverse');
axis equal
xlabel('\bf \fontsize{12}\fontname{Times}Position (m)'); 
ylabel('\bf \fontsize{12}\fontname{Times}Depth (m)');



