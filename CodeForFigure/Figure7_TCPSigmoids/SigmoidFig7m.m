clear all;
close all;




soldose=nan(4,10);
stddose=nan(4,10);
proba=0.5;
tabledelT=[  1 1 2 2 3 3 3];
%tabledelT=2;
indexD=0;
mycm=jet(10);
legend_str = {'Standard LQ model','Hypo', 'Perf+ Hypo','Perf+HYPO+ECDeath'};
for fracD= [ 2 3 4 6 8 10 15]
%for fracD=2
    indexD=indexD+1;
    delT=tabledelT(indexD);
    x=0:120;
    figure(1)
    if fracD==2
         [soldose(:,fracD),allfit,pfit,stddose(:,fracD)]=plotfigure7sigmoid2Gy( fracD,delT,proba );
    else
    [soldose(:,fracD),allfit,pfit,stddose(:,fracD)]=plotfigure7sigmoid( fracD,delT,proba );
    end
    drawnow;
    saveas(gcf,['Figures/tumorcontrol50_fracD_',num2str(fracD),'_delT',num2str(delT),'.fig']);
    saveas(gcf,['Figures/tumorcontrol50_fracD_',num2str(fracD),'_delT',num2str(delT),'.png']);
    
    figure(2)
    for m=1:4
        subplot(2,2,m);
        myfit=allfit{m};
        if ~isempty(myfit)
            y=( 1./(1 + exp(-myfit.lambda*x + myfit.shift)));
            p=shadedErrorBar(x,y,abs(pfit{m}(:,1)-y')); hold on;
            %set(p,'Color',mycm(fracD,:));
            if(fracD~=15)
            set(p.mainLine,'Color',mycm(fracD,:));
            set(p.edge,'Color','none');
            set(p.patch,'facecolor',mycm(fracD,:));
            set(p.patch,'faceAlpha',0.3);
            end
        end
        axis([0 120 0 1]);
        title(legend_str{m});
    end
    
    
end