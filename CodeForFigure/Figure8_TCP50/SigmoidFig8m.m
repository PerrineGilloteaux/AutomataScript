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
 