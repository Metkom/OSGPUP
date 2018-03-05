% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: Rizaldi, Muhammad; Rheza, Mochamad; Riantoni, Frans; Listanto, Virgiawan;
% Mawalid, Abi (2018): Konversi Data Biner 32 Bit Menjadi Desimal dengan Menggunakan 
% Format IBM dan IEEE. figshare. https://doi.org/10.6084/m9.figshare.5947708.v2

clear; clc;

x = input('masukkan nilai biner (32) = ');

% example
% x = [0 1 0 0 0 0 1 0 0 1 1 0 1 1 0 0 1 0 1 0 1 1 0 1 0 0 0 1 0 1 0 1];

d1 = x(1);
sign = (-1)^(d1);
m = 0;
k = 0;
a = -1;
l = 0;
disp('1. IBM')
disp('2. IEEE')
n = input('Masukkan pilihan konversi: ')

if n == 1
    for i = 8:-1:2;
        k = k+(x(i)*(2^(m)));
        m = m+1;
    end
    for j = 9:32
        l = l+(x(j)*(2^(a)));
        a = a-1;
    end
    %% IBM
    IBM = sign*l*16^(k-64)
    
elseif n == 2
    for i = 9:-1:2;
        k = k+(x(i)*(2^(m)));
        m = m+1;
    end
    for j = 10:32
        l = l+(x(j)*(2^(a)));
        a = a-1;
    end
    %% IEEE
    IEEE = -1^sign*(1+l)*2^(k-127)
    
else
disp('Nilai yang anda masukkan salah')
end