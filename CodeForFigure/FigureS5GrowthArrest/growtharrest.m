fracD=0:0.1:15;
d_ar=[0 1 2 4 8 15]; %dose for growth arrest measurement
gar = [0 0 24 36 48 65]/24;
gar_days = interp1(d_ar,gar,fracD,'pchip');
figure,
plot(fracD,gar_days); hold on, plot(4,36/24,'ok');