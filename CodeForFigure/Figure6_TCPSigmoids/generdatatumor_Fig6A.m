% This script will establish tumor control curves as a function total dose
% for various fraction protocol Missing values were 1 gy, 3 gy , 6 gy and
% 10gy
% August 2015
clear all, close all
tic




field_size = 600; % in v8 tumor dilation is fieldsize/4 not by 2 to avoid space saturation


extra_days = 15; % number of days to track after IR (important to see if cell goes to 0)
RTres=0.01; % At beginning, difonly 1% of tumor cells are hypoxic.
O2_th=0.002; % 0.2% Oxygen level defines hypoxia below it.
num_sample = 100; % number of simulated tumors to be ran to compute average response
%sim_results = zeros(11*4,6); % For each dose and fraction, report fracD, numD, TotalD, Tumor control, TC error, delT
% 4 doses, 11 fraction regimens

tc4 = nan(num_sample,1);

sim_count = 1;
T_stack1=[];
o2_stack1=[];


o2_lev1=[];
indexD=0;
parallel=1;
n_cell_layer=3;



leaking_factor=1.5;

extradays0=15;

    
%% actual simulation for numcell only (generate stack where needed with parralel option set to 0 and a classical for loop
% (one patient is enough for stack by the way)
tabledelT=[ 1 ];
for fracD = [ 3 ]
    %fracD = [0 ] % Dose per fraction
    indexD=indexD+1;
    delT=tabledelT(indexD);
    for numD = unique([ 1 round(8/fracD) round(12/fracD) round(16/fracD) round(18/fracD) round(20/fracD) round(linspace(21/fracD,80/fracD,30))]) % number of fractions (DOSE TOTAL=70?)
        
        fprintf('%d Gy, %d fractions, %d days between exposure\n',fracD,numD,delT);
        
        cell_num4_arr=[];
        parfor i_sample = 1:num_sample; % number of repeat for average
            i_sample
            % Tstack not used here for parfor: use a classical for loop to
            % get T_stack1
          
            [T_stack1,o2_stack1,cell_num4,o2_lev4] = Hypoxia_model_v11(field_size,fracD,numD,delT,RTres,O2_th,1.5,extra_days,1,1,n_cell_layer,parallel,0);
            
            tc4(i_sample) = sum(cell_num4(end,1:2))==0;
            cell_num4_arr(:,:,i_sample) = cell_num4;
            % forbidden in parfor save(['Results\cell_num_DoseotherControl3D',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'_run',num2str(i_sample),'.mat']);
        end
       
        cell_num4 = mean(cell_num4_arr,3);
        cell_num4_std = std(cell_num4_arr,[],3);
        
        
        
        sim_count = sim_count + 1;
       
        save(['Results\cell_num_Dose_f600_cl2_m4_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'test2.mat'],'cell_num4','cell_num4_std','tc4');
        
        %clear cell_num1 cell_num1_std  cell_num1_arr
    end
end
toc