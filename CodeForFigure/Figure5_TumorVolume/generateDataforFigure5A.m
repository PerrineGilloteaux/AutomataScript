
%clear all, close all
tic

field_size = 600; % in v11 tumor dilation is fieldsize/6 not by 2 or 4 to avoid space saturation

extra_days = 20; % number of days to track after IR (important to see if cell goes to 0)
RTres=0.01; % At beginning, difonly 1% of tumor cells are hypoxic.
O2_th=0.002; % 0.2% Oxygen level defines hypoxia below it.
num_sample = 1; % number of simulated tumors to be ran to compute average response
%sim_results = zeros(11*4,6); % For each dose and fraction, report fracD, numD, TotalD, Tumor control, TC error, delT
% 4 doses, 11 fraction regimens

sim_count = 1;
T_stack1=[];
o2_stack1=[];

o2_lev1=[];

parallel=0;
n_cell_layer=3;
%% Data for growth control only


cell_num1_arr=[];
leaking_factor=1.5;
waitfor=21;


    indexD=0;
%% actual simulation for numcell only (generate stack where needed with parralel option set to 0 and a classical for loop
% (one patient is enough for stack by the way)
tabledelT= 1 ;
tablenumD= 10 ;
for fracD =  2 
    %fracD = [0 ] % Dose per fraction
    indexD=indexD+1;
    delT=tabledelT;
    numD=tablenumD; 
        
        fprintf('%d Gy, %d fractions, %d days between exposure\n',fracD,numD,delT);
        cell_num1_arr=[];
      
      for i_sample = 1:num_sample; % number of repeat for average
            i_sample
            % Tstack not used here for parfor: use a classical for loop to
            % get T_stack1
            [T_stack1,o2_stack1,cell_num1,o2_lev1] = Hypoxia_model_v11(field_size,fracD,numD,delT,RTres,O2_th,leaking_factor,extra_days,1,1,n_cell_layer,parallel,waitfor);
            
            tc1(i_sample) = sum(cell_num1(end,1:2))==0;
            cell_num1_arr(:,:,i_sample) = cell_num1;
           
         
       end
        cell_num1 = mean(cell_num1_arr,3);
        cell_num1_std = std(cell_num1_arr,[],3);
       
        
        
        sim_count = sim_count + 1;
        save(['Results\stack2_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'.mat'],'T_stack1','o2_stack1');
        
        
        %clear cell_num1 cell_num1_std  cell_num1_arr
    
end

toc