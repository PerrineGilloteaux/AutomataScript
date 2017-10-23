%testing Jel mouse to cli nical extension, and see different rates
clear all, close all
%% PROFIT 78 2Gy

fracD=2
doseTotale=78
numD = round(doseTotale/fracD)
alpha=0.13
beta=0.039
alv = 0.19;
bev = 0.039;
pcJoel=0.25;
%% test 1: Perf+HYPO+ECDeath
leak_factor = 1.3; %each time there is a death hit in blood vessel, that vessel becomes leak_factor times more leaky
% Basically, leak_factor the scaling factor for O2
% point source level at vesssel position
O2_option=1;
EC_death_option=1;

field_size = 200;
T_clear = 10; %number of days it takes for a dead cell to clear

extra_days = 20; % number of days to track after IR (important to see if cell goes to 0)
RTres=0.01; % At beginning, only 1% of tumor cells are hypoxic.
O2_th=0.002; % 0.2% Oxygen level defines hypoxia below it.
num_sample = 400; % number of simulated tumors to be ran to compute average response
nbrep=5;
tcp5 = zeros(num_sample,nbrep);
tcp4 = zeros(num_sample,nbrep);
tcp3 = zeros(num_sample,nbrep);
tcp2 = zeros(num_sample,nbrep);
sim_count = 1;
% Profit 60 3G; 5, 4, 3, 2
% 


%fprintf('%d Gy, %d fractions, %d days between exposure\n',fracD,numD,delT);
for rep = 1:nbrep % number of repeat for average
    parfor i_sample = 1:num_sample % number of repeat for average
            %function [cell_stack,o2_stack,cell_num,o2_lev] = Hypoxia_model(field_size,fracD,numD,delT,RTres,O2_th,leak_death,extra_days,O2_option,EC_death_option,cell_layer,parralel,alpha,beta,alv,bev,pcJoel)
            delT=1;
            [T_stack1,o2_stack1,cell_num1,o2_lev1] = Hypoxia_model(field_size,fracD,numD,delT,RTres,O2_th,1.3,extra_days,1,1,1,1,alpha,beta,alv,bev,pcJoel);
            
            tcp5(i_sample,nbrep) = sum(cell_num1(end,1:2))==0;
            delT=2;
            [T_stack1,o2_stack1,cell_num1,o2_lev1] = Hypoxia_model(field_size,fracD,numD,delT,RTres,O2_th,1.3,extra_days,1,1,1,1,alpha,beta,alv,bev,pcJoel);
            
            tcp3(i_sample,nbrep) = sum(cell_num1(end,1:2))==0;
            delT=3;
            [T_stack1,o2_stack1,cell_num1,o2_lev1] = Hypoxia_model(field_size,fracD,numD,delT,RTres,O2_th,1.3,extra_days,1,1,1,1,alpha,beta,alv,bev,pcJoel);
            
            tcp2(i_sample,nbrep) = sum(cell_num1(end,1:2))==0;
     end
end

  save(['Results\cell_num_Dose',num2str(fracD),'nbdose',num2str(numD),'test5.mat'],'tcp5');
        save(['Results\cell_num_Dose',num2str(fracD),'nbdose',num2str(numD),'test3.mat'],'tcp3');
        save(['Results\cell_num_Dose',num2str(fracD),'nbdose',num2str(numD),'test2.mat'],'tcp2');

