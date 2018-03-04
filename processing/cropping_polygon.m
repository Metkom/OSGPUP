% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: Purba, Christie A.; Sihotang, Suleman M.; Reynara, Rafael; 
% Christianto, Laurensius C.; Akbar, Catur H. A.; Amir, Andi L. R. (2018): Cropping with Polygon. figshare.
% https://doi.org/10.6084/m9.figshare.5946952.v1

clear; close; clc;
a = load('OUTPUT2.txt');
xq = a(:,1);yq = a(:,3);zq = a(:,2)
plot(xq,yq,'bo');
disp(' Cropping With Polygon ')
disp('=======================')
 
title('\bf \fontsize {14}\fontname{Times}PILIH TITIK UNTUK MENANDAI DAERAH DATA YANG INGIN DI CROP','color','r')
xlabel('\bf \fontsize{12}\fontname{Times}X','color','r');
ylabel('\bf \fontsize{12}\fontname{Times}Y','color','r');
 
n = input(' Masukkan Jumlah Titik = ');
[xv,yv] = ginput(n)
plot(xv,yv)
set(gcf,'color','magenta')
 
hold on
[in, on] = inpolygon(xq, yq, xv, yv)
plot(xq(in), yq(in), 'ro')
set(gca,'Color','cyan')
hold off
 
A = xq(in);disp(A)
B = yq(in);disp(B)
C = zq(in)
 
%SIMPAN FILE
fileku = fopen('OutputCropping.txt','wt');
A = A;
B = B;
C = C;
LL = length(A)
FormSpec = '%.2f\t\t%.2f\t%.2f\n';
 
fprintf(fileku,'A\t\tB\tC\n');
for i = 1:LL
    fprintf(fileku,FormSpec,A(i),B(i),C(i))
end
fclose(fileku);

