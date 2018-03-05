% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: Wirantara, Putu Pasek; Nagara, Jeremy Adi Padma; Purwakusuma, Rachenda Pandu; 
% Rahmah, Tazkia; Christofel, David (2018): Mencari Kecepatan dan Kedalaman Gelombang Seismik Refraksi. figshare.
% https://doi.org/10.6084/m9.figshare.5946700.v1

clear; close; clc;
% load data
data = ReadSegy('Bla-bla.sgy');
time = [0:500]*0.004;

figure(1)
for i = 560:700
    plot(data(:,i)+500*i,time,'m');
    set(gca,'Ydir','reverse')
    hold on;
end


axis([280000 330000 0 1.2]);
ylabel('\bf \fontsize{12}\fontname{Consolas}Time (s)');
xlabel('\bf \fontsize{12}\fontname{Consolas}Length (m)');
title('\bf \fontsize{15}\fontname{Consolas}Data Refraksi Seismik');

% first break picking
[xq,tq] = ginput(4);
hold on
plot(xq,tq,'-b')

figure(2)
plot((xq-280000)/10,tq,'bo');hold on
plot((xq-280000)/10,tq,'-b');
ylabel('\bf \fontsize{12}\fontname{Consolas}Time (s)');
xlabel('\bf \fontsize{12}\fontname{Consolas}Offset (m)');
title('\bf \fontsize{15}\fontname{Consolas}Data Refraksi Seismik');


% calculating velocity
datapick = [xq tq];

a = datapick;
figure(1)
x = a(1:2,1);
y = a(1:2,2);
plot(x,y);
m1 = (y(2)-y(1))/(x(2)-x(1));
Velocity1 = 1/m1


figure(2)
A = a(2:3,1);
B = a(2:3,2);
plot(A,B);
m2 = (B(2)-B(1))/(A(2)-A(1));
Velocity2 = 1/m2

figure(3)
C = a(3:4,1);
D = a(3:4,2);
plot(C,D);
m3 = (D(2)-D(1))/(C(2)-C(1));
Velocity3 = 1/m3

% Estimating the depth
n = load('datavelocitydantime.txt');
x = n(1:3,1);
y = n(1:3,2);

b = x(1)*y(2)*y(1);
c = y(2)^2;
d = y(1)^2;
e = sqrt(c-d);
f = 2*e;
g = y(3)^2;
h = sqrt(g-d);
i = y(3)*y(1);
j = y(3)*y(2);
k = sqrt(g-c);
l = 2*(b/f)*h;
m = 2*k;

D1 = b/f
D2 = (x(2)-(l/i))*(j/m)+D1