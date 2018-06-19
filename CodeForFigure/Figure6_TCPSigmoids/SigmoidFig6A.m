clear all;
close all;


soldose=nan(4,10);
proba=0.5;
tabledelT=[1];
indexD=0;
indexD=indexD+1;
delT=tabledelT(indexD);
fracD=3;
soldose(:,fracD)=plotfigure6Asigmoid( fracD,delT,proba );

 