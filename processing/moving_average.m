% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite:

clear; close; clc;
disp('***********************************************************')
disp('PROGRAM SMOOTHING DATA 1D DENGAN MOVING AVERAGE')
disp('By : Kelompok 9')
disp('***********************************************************')

%LOAD DATA 
data = load ('rawdata.las');
GR = data(1:500,6);
%MEMILIH ORDE
n = input('Masukkan Jumlah Orde = ');
%MOVING AVERAGE DENGAN ORDE RANDOM
for i = 1:(length(GR)-n)
    m = 0;
    for k = i:n+i-1
      cc = GR(k);
      m = m+cc;
    end
    c(i) = m/n;
end

%MENYIMPAN HASIL MOVING AVERAGE KE .TXT
header1 = 'Raw Data';
header2 = 'Moving Average';
fid = fopen('Hasil.txt','w');
fprintf(fid, [ header1 ' ' header2 'r\n']);
fprintf(fid, '%f %f \n',GR,c);
fclose(fid);
%PLOTTING
subplot(2,1,1)
plot(GR)
grid on; 
xlabel('GR (API)');
ylabel('TVD (m)');  
subplot (2,1,2)  
plot(c,'-','LineWidth',1) 
hold on   
plot(GR)
xlabel('GR (API)');
ylabel('TVD (m)');  
legend('Moving Average','Raw Data')