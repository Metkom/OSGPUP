% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: Yasir, Moh.; Haq, M. Syauqil; Lase, Fanzly Togap Zisochi; 
% Sena, Ariestian; Ilmi, M. Wildi Nurul; Sestha, Andrata Ganesha (2018): 
% First Break Picking Data Seismik Refraksi. figshare.
% https://doi.org/10.6084/m9.figshare.5946697.v1

clear all; close all; clc;
data = ReadSegy ('Bla-bla.sgy');
time = [0:500]*0.0004;

q1 = input ('Batas bawah trace: ');
q2 = input ('Batas atas trace: '):
p = input ('Masukkan banyaknya trace tiap figure: ');

a = q1-1; % untuk menyimpan di .txt
b = q1-a; % untuk menyimpan di .txt
wf = 0; % untuk menyimpan di .txt

qq = (q2-q1)+1; % Banyak trace 
n = 1; np = qq/p;
% Masukkan tempat penyimpanan setiap run
xA = zeros(qq,1);tA = zeros(qq,1);
m = 0;
while (n<=np)
      iper = (n-1)*p+q1;
      iked = iper+p-1; % Bergantung dengan iper
      m = m+1;
      
      figure (m)
      for i = iper:iked
          plot (data(:,i)+2000*i,time,'m');
          set (gca,'Ydir','reverse')
          hold on;
      end

      %Picking 
      [xq,tq] = ginput (p);
      wi = b+wf;
      wf = wi+p-1;
      xA(wi:wf) = xq;
      tA(wi:wf) = tq;
      n = n+1;

      %Gambar bulet
      m = m+1;
      figure (m)
      plot(xq,tq,'ro');
end

% Simpan data picking
datapick = [xA,tA];
save('datapick.txt','datapick','-ascii');

% Gambar Total
figure (m+1)
plot(xA,tA,'ro');
xlabel('\bf\fontsize{12}\fontname{Consolase}Length (m)');
ylabel('\bf\fontsize{12}\fontname{Consolase}Length (m)');
set(gca,'Ydir','reverse')
title('\bf\fontsize{15}\fontname{Consolase}Data Refraksi Seismik');