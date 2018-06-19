%clear all, close all;

data4x=[ 0 14];
data4y=[240 750];
  dt=3;  



xlabel('Days');
ylabel('Tumor Volume in mm^3');

% OR piR2=Ncell-> V=4/3*pi*(sqrt(ncell)^3)
fracD=0;numD=0;delT=1;

load('Results/cell_num_0nbdose0delT1.mat');
t=3
volcell=48/(sum(cell_num1(t,[1,2,5]),2).*sqrt(sum(cell_num1(t,[1,2,5]),2)));

volcell^(1/3)
%x=1:length(sum(cell_num1(:,[1,2,5]),2));
x= -1:length(cell_num1)-2;
%shadedErrorBar(x,volcell*sum(cell_num1(:,[1,2,5]),2).*sqrt(sum(cell_num1(:,[1,2,5]),2)), sum(cell_num1_std(:,[1,2,5]),2).*sqrt(sum(cell_num1(:,[1,2,5]),2))*volcell);hold on;
shadedErrorBar(x,volcell*sum(cell_num1(:,[1,2,5]),2).*sqrt(sum(cell_num1(:,[1,2,5]),2)), sum(cell_num1_std(:,[1,2,5]),2).*sqrt(sum(cell_num1(:,[1,2,5]),2))*volcell);hold on;

load('Results/cell_num_2nbdose10delT1.mat');
%x=1:length(sum(cell_num1(:,[1,2,5]),2));
%x= 1:length(cell_num1);
t=23;
%volcell=240/(sum(cell_num1(t,[1,2,5]),2).*sqrt(sum(cell_num1(t,[1,2,5]),2)));
volcell^(1/3)
x= -1:length(cell_num1)-2;
%shadedErrorBar(x,volcell*sum(cell_num1(:,[1,2,5]),2).*sqrt(sum(cell_num1(:,[1,2,5]),2)), sum(cell_num1_std(:,[1,2,5]),2).*sqrt(sum(cell_num1(:,[1,2,5]),2))*volcell);hold on;
shadedErrorBar(x,volcell*sum(cell_num1(:,[1,2,5]),2).*sqrt(sum(cell_num1(:,[1,2,5]),2)), sum(cell_num1_std(:,[1,2,5]),2).*sqrt(sum(cell_num1(:,[1,2,5]),2))*volcell);hold on;

dt=1;
%plot(dt+data4x+20,data4y,'om');hold on
EW=[40 100];
MeasuredDaysirr=[0 1 3 7 14]+dt+20;
errorbar(dt+data4x+20,data4y,EW);
TumorWeightirr=[240 220 290 280 240];
EWI=[240-200 220-180 290-250 280-240 240-200];
errorbar(MeasuredDaysirr,TumorWeightirr,EWI);hold on,