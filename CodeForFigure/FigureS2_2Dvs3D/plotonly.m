figure
t=2;
for n_cell_layers=3
fracD=0;numD=0;delT=1;
load(['Results\cell_num_Control_ncl_',num2str(n_cell_layers),'D_',num2str(fracD),'_nbdose',num2str(numD),'_delT',num2str(delT),'.mat']);


%volcell=48/(sum(cell_num1(t,[1,2,5]),2).*sqrt(sum(cell_num1(t,[1,2,5]),2)));
volcell=4/(3*sqrt(pi))*((0.015*0.015)^(3/2))*48/1.901;
%volcell=volcell*48/(sum(cell_num1(t,[1,2,5]),2).*sqrt(sum(cell_num1(t,[1,2,5]),2)));
volcell^(1/3)
plot(1:length(cell_num1),volcell*sum(cell_num1(:,[1,2,5]),2).*sqrt(sum(cell_num1(:,[1,2,5]),2)),'r-');hold on;
end
t=2;
for n_cell_layers=3
fracD=0;numD=0;delT=1;
load(['Results\cell_num_Control3D_ncl_',num2str(n_cell_layers),'D_',num2str(fracD),'_nbdose',num2str(numD),'_delT',num2str(delT),'.mat']);

volcell=(0.015*0.015*0.015)*48/1.955;
%volcell=( 0.0136* 0.0136* 0.0136);
%volcell=48/(sum(cell_num1(t,[1,2,5]),2));
volcell^(1/3)
plot(1:length(cell_num1),volcell*sum(cell_num1(:,[1,2,5]),2), 'g-');hold on;
end


%% Define Experimental Data reference from Potiron (Figure 1B PlosOne 2013)not fINISHED
%Growth tumor experimental data
data1x=[4
8
9
12
14
16
18
22
];

data1y=[50
75
80
100
140
175
190
230
];
data2x=[0
8
10
15
21
24
28
];

data2y=[350
450
650
900
1250
1500
1900];

data3x=[25
29
33
39
46
54
];
data3y=[80
130
175
250
700
1150
];
data4x=[ 0 14];
data4y=[240 750];
  dt=1;  
plot(dt+data1x-4,data1y,'ob');hold on,
plot(dt+data2x-8+30,data2y,'or');hold on,
plot(dt+data3x-27+9,data3y,'oy');hold on,
plot(dt+data4x+20,data4y,'om');hold on

