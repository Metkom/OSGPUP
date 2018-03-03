% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Download: https://www.mathworks.com/matlabcentral/fileexchange/66294-forward-modeling-metode-gravity--intrution-model
% Cite: E.B.G. Umboh, et. al. 2018. Forward modelling metode gravitasi. http://doi.org/10.5281/zenodo.1186957 
% Cek

clear; clc;

%--- Parameter Model (rho)
rho   = 1;     % Perbedaan densitas (kg/m^3)

%--- Konstanta
z1    = 50;    % Kedalaman plat dalam (m)
z2    = 150;   % Kedalaman plat dangkal
x0    = 100;   % Letak patahan (m)
t     = 40;    % Tebal patahan (m)
cGrav = 6.674e-11;  % Konstanta Gravitasi (m^3 kg^-1 s^-2)
si2mg = 1e5;        % 1 SI (ms^-2) = 1e5 mGal

%--- Lokasi Pengukuran
x = -500:20:500;

%%--- FORMULA FORWARD SPHERE
k = 2*cGrav*rho*t;
for i = 1:length(x)
  dg(i) = k*(pi+(atan((x(i)-x0)/z1))-(atan((x(i)-x0)/z2))); %ms^2
end

%--- Forward modeling
dg  = dg*si2mg;  %1 SI = 1e5 mGal

%%--------- PLOT FORWARD ---------%%
figure(1)
subplot(2,1,1)
plot(x,dg,'.','color','r','MarkerSize',15);
xlim([min(x) max(x)]);
xlabel('\bf \fontsize{12}\fontname{Times}Position (m)');
ylabel('\bf \fontsize{12}\fontname{Times}\Delta g (mGal)');
title ('\bf \fontsize{14}\fontname{Times}Modeling Gravity - Fault');

% Gambar patahan
subplot(2,1,2)
% Zona 1
left  = x(1);
right = x0;
top   = -z2;
bottom= top-t;
xx    = [left left right right];
yy    = [bottom top top bottom];
fill(xx,yy,'r');
hold on

% Zona 2
left_2  = x0;
right_2 = x(length(x));
top_2   = -z1;
bottom_2= top_2-t;
xx      = [left_2 left_2 right_2 right_2];
yy      = [bottom_2 top_2 top_2 bottom_2];
fill(xx,yy,'r');
xlim([min(x) max(x)]);

title(['\bf \fontsize{12} \fontname{Times}Model => ','\rho = ', ...
      num2str(rho),' kg/m^3 ; z_1 = ',num2str(z1),...
      ' m ; z_2 = ',num2str(z2),' m ; t = ',num2str(t),' m ; x_0 = ',...
      num2str(x0),' m']);
xlabel('\bf \fontsize{12}\fontname{Times}Position (m) ' );
ylabel('\bf \fontsize{12}\fontname{Times}Depth (m) ');
xlim([min(x) max(x)]);
axis equal;
