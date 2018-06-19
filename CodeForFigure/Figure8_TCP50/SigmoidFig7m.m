clear all;
close all;


soldose=nan(4,10);
proba=0.5;
tabledelT=[ 3 3 3 ];
tablefracD=[ 8 10 15  ]
index=0;
for fracD=tablefracD
    index=index+1;
delT=tabledelT(index);

soldose(:,fracD)=plotfigure7sigmoid( fracD,delT,proba );
end
 clear all;
close all;


soldose=nan(4,10);
stddose=nan(4,10);
proba=0.5;
tabledelT=[  1 1 2 2 3 3];
indexD=0;
mycm=jet(10);
%legend_str = {'Perf+HYPO+ECDeath', 'Perf+ Hypo','Hypo','Standard LQ model'};
for fracD= [ 2 3 4 6 8 10]
    indexD=indexD+1;
    delT=tabledelT(indexD);
    x=0:120;
    figure(1)
    [soldose(:,fracD),allfit,pfit,stddose(:,fracD)]=plotfigure5sigmoidmixedinputv3( fracD,delT,proba );
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
            set(p.mainLine,'Color',mycm(fracD,:));
            set(p.edge,'Color','none');
            set(p.patch,'facecolor',mycm(fracD,:));
            set(p.patch,'faceAlpha',0.3);
        end
        axis([0 120 0 1]);
        title(legend_str{m});
    end
    
    
end