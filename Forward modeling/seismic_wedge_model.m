% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: N. Anugerah, et. al. 2018. Membuat model sintetik untuk model pembajian. http://doi.org/10.5281/zenodo.1186490

% Ricker Wavelet
dt = 0.004;
f = 15;
phi = 3.14;
t0 = 0;
t = [-16:dt:16];
r = (1-2*(phi*f*dt.*(t-t0)).^2)./exp((phi*f*dt.*(t-t0)).^2);
y = decimate(r,120);

% Plotting Hasil Convolution Hasil Membaji
figure(1)
plot(y)
title('Wavelet');
for i = 1:5:1000
    c = 1:315;
    ff = 1:249;
    b = conv(Reflect(:,i),y);
    amax(i) = max(b);
    figure(1)
    plot(10*b+(i*0.25),c);
    figure(1)
    hold on
    title('Wedge Model f=15Hz')
    set(gca,'ydir','reverse')
    axis([100 250 0 250])
end

% Tunning Thickness
figure(2)
for i = 1:5:1000
    plot(i/4,amax(i),'*r');hold on
    axis([100 250 0 0.6])
end
