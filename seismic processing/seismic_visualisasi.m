% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: I.P. Virginia, et. al. 2018. Visualisasi data seismik 2D. http://doi.org/10.5281/zenodo.1186453

clear; clc; close;

% Read data segy
data = ReadSegy('Bla-bla.sgy');
data = read_segy_file('Bla-bla.sgy',{'traces','CMP<201'});
a = [1:(4/1499):5]';
time = [1:1500]*0.002;
 
% Visualisasi data
for i = 1:200
    data2 = data([1:1500],i).*a;
    new = (data2+10000*i)./10000;   
    level_max = max(new);
    level_min = min(new);
    level_ave = ((level_max+level_min)/2)+0.05;
    plot(new,time);
    hold on;
    area(max(new, level_ave),time,level_ave,'EdgeColor','none','FaceColor','b')
    area(min(new, level_ave),time,level_ave,'EdgeColor','none','FaceColor','r')
    set(gca,'Ydir','reverse')
    set(gca,'XAxisLocation','top');
end
 
xlabel('CMP')
ylabel('time(s)')
axis([0 200 0 3])
hold off
 
data100 = data([1:1500],100).*a;
y = data100; % y data
level = 3; % level

figure
plot(y,time)
hold on
area(max(y, level),time, level, 'EdgeColor', 'none', 'FaceColor', 'b')
area(min(y, level),time, level, 'EdgeColor', 'none', 'FaceColor', 'r')
 
set(gca,'Ydir','reverse')
set(gca,'XAxisLocation','top');
xlabel('CMP')
ylabel('time(s)')
