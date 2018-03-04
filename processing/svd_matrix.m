% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: Sihombing, Willi Leonardo; Pratama, Ratih N. A. C. Putri; 
% Gaol, Yosua H. Lumban; Istiqomah; Sasti, Afif Fakhri; 
% Haolia (2018): Singular Value Decomposition untuk Matriks 5x5. figshare.
% https://doi.org/10.6084/m9.figshare.5946976.v1

clear all;close all; clc;
disp('===============================')
disp('===========PROGRAM=============')
disp('=======SVD Matrix 5x5==========')
disp('===============================')
%Matrix A
A = [1 3 6 1 6; 6 9 2 2 3; 2 6 2 7 4; 7 4 0 4 0; 0 0 0 0 0];
B = 0.01.*A;
C = A*B;
[U,S,V] = svd(A);
for i = 1:5
    for j = 1:5
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end 
end
Ai = V*So*U';
Bo = Ai*C;
G = B-Bo;
disp('Nilai dari Matrix A= '); disp (A);
disp('Nilai dari Matrix B= '); disp (B);
disp('Nilai dari Matrix Ainvers*C=(B) '); disp (Bo);
disp('Nilai dari Galat Matrix B= '); disp (G);
disp('Nilai dari Matrix C= '); disp (C);
disp('Nilai dari U= '); disp (U);
disp('Nilai dari Eigen Value= '); disp (S);
disp('Nilai dari Eigen Vector= '); disp (V);
disp('Nilai dari Matrix Ainvers= '); disp (Ai);
 
%Matrix 100
n1 = 100;
h = waitbar(0,'Travel Time N-1, Please wait...');
steps = n1;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close(h)
t = cputime;
B1 = magic (n1);
A1 = 0.01.*B1;
C1 = A1*B1;
[U,S,V] = svd(A1);
%Hitung B~V*So*U'
for i = 1:n1
    for j = 1:n1
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end  
end
A1 = V*So*U';
Bc = A1*C1;
elapsedtime1 = cputime-t;
 
%Matrix 200
n2 = 200;
h = waitbar(0,'Travel Time N-2, Please wait...');
steps = n2;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close(h)
t = cputime;
B2 = magic (n2);
A2 = 0.01.*B2;
C2 = A2*B2;
[U,S,V] = svd(A2);
%Hitung B~V*So*U'
for i = 1:n2
    for j = 1:n2
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end
end
A2 = V*So*U';
B2 = A2*C2;
elapsedtime2 = cputime-t;
 
%Matrix 300
n3 = 300;
h = waitbar(0,'Travel Time N-3, Please wait...');
steps = n3;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close(h)
t = cputime;
B3 = magic (n3);
A3 = 0.01.*B3;
C3 = A3*B3;
[U,S,V] = svd(A3);
%Hitung B~V*So*U'
 
for i = 1:n3
    for j = 1:n3
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end
end
A3 = V*So*U';
B3 = A3*C3;
elapsedtime3 = cputime-t;
 
%Matrix 400
n4 = 400;
h = waitbar(0,'Travel Time N-4, Please wait...');
steps = n4;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close(h)
t = cputime;
B4 = magic (n4);
A4 = 0.01.*B4;
C4 = A4*B4;
[U,S,V] = svd(A4);
%Hitung B~V*So*U'
for i = 1:n4
    for j = 1:n4
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end
end
A4 = V*So*U';
B4 = A4*C4;
elapsedtime4 = cputime-t;
 
%Matrix 500
n5 = 500;
h = waitbar(0,'Travel Time N-5, Please wait...');
steps = n5;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close(h)
 
t = cputime;
B5 = magic (n5);
A5 = 0.01.*B5;
C5 = A5*B5;
[U,S,V] = svd(A5);
 
%Hitung B~V*So*U'
for i = 1:n5
    for j = 1:n5
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end 
end
A5 = V*So*U';
B5 = A5*C5;
elapsedtime5 = cputime-t;
 
%Matrix 600
n6 = 600;
h = waitbar(0,'Travel Time N-6, Please wait...');
steps = n6;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close(h)
 
t = cputime;
B6 = magic (n6);
A6 = 0.01.*B6;
C6 = A6*B6;
[U,S,V] = svd(A6);
 
%Hitung B~V*So*U'
for i = 1:n6
    for j = 1:n6
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end  
end
A6 = V*So*U';
B6 = A6*C6;
elapsedtime6 = cputime-t;
 
%Matrix 700
n7 = 700;
h = waitbar(0,'Travel Time N-7, Please wait...');
steps = n7;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close (h)
 
t = cputime;
B7 = magic (n7);
A7 = 0.01.*B7;
C7 = A7*B7;
[U,S,V] = svd(A7);
 
%Hitung B~V*So*U'
for i = 1:n7
    for j = 1:n7
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end 
end
A7 = V*So*U';
B7 = A7*C7;
elapsedtime7 = cputime-t;
 
%Matrix 800
n8 = 800;
h = waitbar(0,'Travel Time N-8, Please wait...');
steps = n8;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close (h)
 
t = cputime;
B8 = magic (n8);
A8 = 0.01.*B8;
C8 = A8*B8;
[U,S,V] = svd(A8);
%Hitung B~V*So*U'
for i = 1:n8
    for j = 1:n8
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end 
end
A8 = V*So*U';
B8 = A8*C8;
elapsedtime8 = cputime-t;
 
%Matrix 900
n9 = 900;
h = waitbar(0,'Travel Time N-9, Please wait...');
steps = n9;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close(h)
 
t = cputime;
B9 = magic (n9);
A9 = 0.01.*B9;
C9 = A9*B9;
[U,S,V] = svd(A9);
 
%Hitung B~V*So*U'
for i = 1:n9
    for j = 1:n9
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end   
end
A9 = V*So*U';
B9 = A9*C9;
elapsedtime9 = cputime-t;
 
%Matrix 1000
n10 = 1000;
h = waitbar(0,'Travel Time N-10, Please wait...');
steps = n10;
for step = 1:steps
    % computations take place here
    waitbar(step/steps)
end
close(h)
 
t = cputime;
B10 = magic (n10);
A10 = 0.01.*B10;
C10 = A10*B10;
[U,S,V] = svd(A10);
 
%Hitung B~V*So*U'
for i = 1:n10
    for j = 1:n10
        if S(i,j)> 0.0001
            So(i,j) = 1/S(i,j);
        else
            So(i,j) = 0;
        end
    end
end
A10 = V*So*U';
B10 = A10*C10;
elapsedtime10 = cputime-t;
 
%Penutup
disp('===================================')
disp('========Nilai Travel Time==========')
disp('====Sudah Disimpan Dalam Folder====')
disp('===================================')
 
%Figure Kurva
y = [0  elapsedtime1,elapsedtime2,elapsedtime3,elapsedtime4,elapsedtime5,elapsedtime6,elapsedtime7,elapsedtime8,elapsedtime9,elapsedtime10];
x = [0  n1 n2 n3 n4 n5 n6 n7 n8 n9 n10];
plot (x,y,'--b*','LineWidth',1.5) 
legend ('Travel Time')
title('\bf \fontsize {14}\fontname{times}Grafik Travel Time Menurut banyaknya data','color','m')
xlabel('\bf \fontsize{12}\fontname{times}Banyak Data','color','c');
ylabel('\bf \fontsize{12}\fontname{times}Waktu (s)','color','r');
grid on
 
%Print Hasil Kurva
elacme = fopen('Hasil Kurva Travel Time.txt','w');
        
fprintf(elacme,'<<=============================================>>\n');
fprintf(elacme,'<<===============DATA TRAVEL TIME==============>>\n');
fprintf(elacme,'<<=============================================>>\n\n');
fprintf(elacme,'<<========================================>>\n');
fprintf(elacme,['Travel Time N ke 1=',num2str(elapsedtime1),'\tSec\n']);
fprintf(elacme,['Travel Time N ke 2=',num2str(elapsedtime2),'\tSec\n']);
fprintf(elacme,['Travel Time N ke 3=',num2str(elapsedtime3),'\tSec\n']);
fprintf(elacme,['Travel Time N ke 4=',num2str(elapsedtime4),'\tSec\n']);
fprintf(elacme,['Travel Time N ke 5=',num2str(elapsedtime5),'\tSec\n']);
fprintf(elacme,['Travel Time N ke 6=',num2str(elapsedtime6),'\tSec\n']);
fprintf(elacme,['Travel Time N ke 7=',num2str(elapsedtime7),'\tSec\n']);
fprintf(elacme,['Travel Time N ke 8=',num2str(elapsedtime8),'\tSec\n']);
fprintf(elacme,['Travel Time N ke 9=',num2str(elapsedtime9),'\tSec\n']);
fprintf(elacme,['Travel Time N ke 10=',num2str(elapsedtime10),'\tSec\n']);
fprintf(elacme,'<<========================================>>\n\n');
