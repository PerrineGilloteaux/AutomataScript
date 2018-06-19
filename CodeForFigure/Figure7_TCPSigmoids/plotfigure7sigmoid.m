function [soldosetotal,myfitall,pall,std_dose ] = plotfigure7sigmoid( fracD,delT,survival )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%define sigmoid
myfittype = fittype('1./(1 + exp(-lambda*x + shift))',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'lambda','shift'})
index=1;
soldosetotal=nan(4,1);
std_dose=nan(4,1);
listenumD =[unique([ 1 round(8/fracD) round(12/fracD) round(16/fracD) round(18/fracD) round(20/fracD) round(linspace(21/fracD,80/fracD,30))]) unique(round(linspace(80/fracD,120/fracD,5)))];
x= listenumD*fracD;

myfitall={};
pall={};
syms dosetotal
for numD = unique([ 1 round(8/fracD) round(12/fracD) round(16/fracD) round(18/fracD) round(20/fracD) round(linspace(21/fracD,80/fracD,30))])
    load(['..\Figure8\Results\cell_num_Dose_f600_m1_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'.mat']);
    load(['..\Figure8\Results\cell_num_Dose_f600_m2_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'.mat']);
    load(['..\Figure8\Results\cell_num_Dose_f600_m3_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'.mat']);
    load(['..\Figure8\Results\cell_num_Dose_f600_m4_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'.mat']);
    percent1(index)=mean(tc1);
    percent2(index)=mean(tc2);
    percent3(index)=mean(tc3);
    percent4(index)=mean(tc4);
    index=index+1;
end
try
    for numD = unique(round(linspace(80/fracD,120/fracD,5)))
        load(['..\Figure8\Results\cell_num_Dose_f600_m1more80_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'.mat']);
        load(['..\Figure8\Results\cell_num_Dose_f600_m2more80_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'.mat']);
        load(['..\Figure8\Results\cell_num_Dose_f600_m3more80_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'.mat']);
        load(['..\Figure8\Results\cell_num_Dose_f600_m4more80_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'.mat']);
        percent1(index)=mean(tc1);
        percent2(index)=mean(tc2);
        percent3(index)=mean(tc3);
        percent4(index)=mean(tc4);
        index=index+1;

    end
catch
    disp(' No more than 80 for this');
    x=unique([ 1 round(8/fracD) round(12/fracD) round(16/fracD) round(18/fracD) round(20/fracD) round(linspace(21/fracD,80/fracD,30))])*fracD;
end
legend_str = {'no O2 effect','Hypo alone', 'Perf+ Hypo','Perf+HYPO+ECDeath'};
for m=1:4
    subplot(2,2,m);
    percent = matlab.lang.makeValidName(['percent',num2str(m)]);
    percent=eval(percent);
    [myfit,gof] = fit(x', percent',myfittype,'StartPoint', [0.2,8] );
    if gof.rsquare>0.5
        eqn = ( 1./(1 + exp(-myfit.lambda*dosetotal + myfit.shift)) == survival);
        soldosetotal(m) = solve(eqn,dosetotal);
        plot(myfit,x,percent),hold on,
        title(['Model ',legend_str{m}]);
        y=0:120;
        p1=predint(myfit,y,0.95,'observation','off');
        %get error on dose total
        [myfit2,gof2] = fit(y', p1(:,1),myfittype,'StartPoint', [0.2,8] );
        eqn = ( 1./(1 + exp(-myfit2.lambda*dosetotal + myfit2.shift)) == survival);
        std_dose(m) = solve(eqn,dosetotal);
        plot(y,p1,'m--'); hold off,
        myfitall={myfitall{:} myfit};
        pall={pall{:} p1};
    else
        plot(x,percent,'.b');
        title(['Model ',legend_str{m}, ' fit has failed']);
        myfitall={myfitall{:} []};
        pall={pall{:} []};
    end
    %axis([0 120 0 1]);
    %
    % title(['dose ',num2str(fracD),'Gy with delT=',num2str(delT)]);
    % legend_str = {'Perf+HYPO+ECDeath', 'Perf+ Hypo','Hypo alone','no O2 effect'};
    % legend(legend_str);
    xlabel('Total Dose in Gy');
    ylabel('Tumor control in % on 100 samples');
    
end

