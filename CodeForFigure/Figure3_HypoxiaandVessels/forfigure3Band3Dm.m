clear all
field_size = 600;


RTres=0.01; % At beginning, only 1% of tumor cells are hypoxic. NEED TO MATCH HYPOXIC CELLS WITH HYPOXIC REGIONS AT BEGINNING
O2_th=0.002; % 0.2% Oxygen level defines hypoxia below it. 
experimental_hypoxic_surface = [0.86 1.22 0.78 0.43 0.1]; % % of tumor that is hypoxic. Goes down with dose as blood vessel leak more
num_frac = [0,1,3,5,10]; % corresponding fraction delivered
legend_str = {};
% Figure 4B with vessel death

% 
% % Hypoxic surface versus dose and time - Experimental data from potiron
% hypoxi_real = [0.86,1.22,0.78,0.44,0.10]/100; % fraction of hypoxic tumor
% 
% %dose_ar = [0:fracD:fracD*5 fracD*5 fracD*5  fracD*5:fracD:fracD*10];
% hypoxi_time = [0 1 3 7 14];
numsamples=100;
% figure; 
% 
% 
% plot(hypoxi_time,hypoxi_real,'o'); hold on;
% legend_str = {legend_str{:} sprintf('Experimental Data')};
% fracD = 2; 
% numD = 10;
% delT=1; % Spacing in days between each exposure (during the week only)
% tableleaking_factor=[ 1.0 1.3 1.5 3];
% for lf=tableleaking_factor
% [hypoxi_level_mean, hypoxi_level_std, num_t,cell_num,o2_lev]=computehypoovertime2(fracD,numD,delT,O2_th,numsamples,lf);
% %day_ar = 0:num_t-1;
% %plot(day_ar,hypoxi_level,'-'); hold on;
% errorbar(hypoxi_level_mean,hypoxi_level_std/sqrt(numsamples));hold on;
% legend_str = {legend_str{:} sprintf('%d Gy, %d fractions, %d delT,%d lf Perf+Hypo+nodeath',fracD,numD,delT,lf)};
% end
% xlabel('days');
% ylabel('Fraction of hypoxic tumor');
% 
% legend(legend_str);
% 
% figure
 lf=1.5;
% fracD = 6; 
% numD = 5;
% delT=3; % Spacing in days between each exposure (during the week only)
% [hypoxi_level_mean, hypoxi_level_std, num_t,cell_num,o2_lev]=computehypoovertime1(fracD,numD,delT,O2_th,numsamples,lf);
% %day_ar = 0:num_t-1;
% %plot(day_ar,hypoxi_level,'-'); hold on;
% errorbar(hypoxi_level_mean,hypoxi_level_std/sqrt(numsamples));hold on;
% legend_str = {legend_str{:} sprintf('%d Gy, %d fractions, %d delT Perf+Hypo+Ecdeath',fracD,numD,delT)};
% xlabel('days');
% ylabel('Fraction of hypoxic tumor');
% 
% legend(legend_str);


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

fracD = 15; 
numD = 2;
delT=3; % Spacing in days between each exposure (during the week only)
[hypoxi_level_mean, hypoxi_level_std, num_t,cell_num,o2_lev]=computehypoovertime1(fracD,numD,delT,O2_th,numsamples,lf);
%day_ar = 0:num_t-1;
%plot(day_ar,hypoxi_level,'-'); hold on;
errorbar(hypoxi_level_mean,hypoxi_level_std/sqrt(numsamples));hold on;
legend_str = {legend_str{:} sprintf('%d Gy, %d fractions, %d delT with vessel death',fracD,numD,delT)};

fracD = 15; 
numD = 2;
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

