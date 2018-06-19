
numsamples=100;
lf=1.5;
legend_str = {};
figure,
fracD = 8; 
numD = 4;
delT=3; % Spacing in days between each exposure (during the week only)
[hypoxi_level_mean, hypoxi_level_std, num_t,cell_num,o2_lev]=computehypoovertime2(fracD,numD,delT,O2_th,numsamples,lf);
%day_ar = 0:num_t-1;
%plot(day_ar,hypoxi_level,'-'); hold on;
errorbar(hypoxi_level_mean,hypoxi_level_std/sqrt(numsamples));hold on;
legend_str = {legend_str{:} sprintf('%d Gy, %d fractions, %d delT no vessel death',fracD,numD,delT)};

fracD = 8; 
numD = 4;
delT=3; % Spacing in days between each exposure (during the week only)
[hypoxi_level_mean, hypoxi_level_std, num_t,cell_num,o2_lev]=computehypoovertime1(fracD,numD,delT,O2_th,numsamples,lf);
%day_ar = 0:num_t-1;
%plot(day_ar,hypoxi_level,'-'); hold on;
errorbar(hypoxi_level_mean,hypoxi_level_std/sqrt(numsamples));hold on;
legend_str = {legend_str{:} sprintf('%d Gy, %d fractions, %d delT with vessel death',fracD,numD,delT)};

fracD = 10; 
numD = 3;
delT=3; % Spacing in days between each exposure (during the week only)
[hypoxi_level_mean, hypoxi_level_std, num_t,cell_num,o2_lev]=computehypoovertime1(fracD,numD,delT,O2_th,numsamples,lf);
%day_ar = 0:num_t-1;
%plot(day_ar,hypoxi_level,'-'); hold on;
errorbar(hypoxi_level_mean,hypoxi_level_std/sqrt(numsamples));hold on;
legend_str = {legend_str{:} sprintf('%d Gy, %d fractions, %d delT with vessel death',fracD,numD,delT)};

fracD = 10; 
numD = 3;
delT=3; % Spacing in days between each exposure (during the week only)
[hypoxi_level_mean, hypoxi_level_std, num_t,cell_num,o2_lev]=computehypoovertime2(fracD,numD,delT,O2_th,numsamples,lf);
%day_ar = 0:num_t-1;
%plot(day_ar,hypoxi_level,'-'); hold on;
errorbar(hypoxi_level_mean,hypoxi_level_std/sqrt(numsamples));hold on;
legend_str = {legend_str{:} sprintf('%d Gy, %d fractions, %d delT with NO vessel death',fracD,numD,delT)};


xlabel('days');
ylabel('Fraction of hypoxic tumor');

legend(legend_str);
figure;

