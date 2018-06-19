clear all
field_size = 600;


RTres=0.01; % At beginning, only 1% of tumor cells are hypoxic. NEED TO MATCH HYPOXIC CELLS WITH HYPOXIC REGIONS AT BEGINNING
O2_th=0.002; % 0.2% Oxygen level defines hypoxia below it. 

num_sample=100;



%% Data for Figure 3B: 2Gy 10 fractions with different leaking factors
% (one patient is enough for stack by the way)
tabledelT=[   3 3 3  ];
tablenumD=[  5 4 2 ]; % 
%tableleaking_factor=[ 1.0 1.3 1.5 3];
tableleaking_factor=[ 1.5];
n_cell_layer=3;
parallel=0;

extra_days=15;
for leaking_factor=tableleaking_factor
    indexD=0;
for fracD = [   6 8 15 ]
    %fracD = [0 ] % Dose per fraction
    indexD=indexD+1;
    delT=tabledelT(indexD);
    numD=tablenumD(indexD);
    
    fprintf('%d Gy, %d fractions, %d days between exposure\n',fracD,numD,delT);
    cell_num1_arr=[];
    cell_num2_arr=[];
    
    for i_sample = 1:num_sample; % number of repeat for average
        i_sample
         %Tstack not used here for parfor: use a classical for loop to
         %get T_stack1
        [T_stack1,o2_stack1,cell_num1,o2_lev1] = Hypoxia_model_v11(field_size,fracD,numD,delT,RTres,O2_th,leaking_factor,extra_days,1,1,n_cell_layer,parallel,0);
        
        tc1(i_sample) = sum(cell_num1(end,1:2))==0;
        cell_num1_arr(:,:,i_sample) = cell_num1;
        [T_stack2,o2_stack2,cell_num2,o2_lev2] = Hypoxia_model_v11(field_size,fracD,numD,delT,RTres,O2_th,leaking_factor,extra_days,1,0,n_cell_layer,parallel,0);
        
        tc2(i_sample) = sum(cell_num2(end,1:2))==0;
        cell_num2_arr(:,:,i_sample) = cell_num2;
        
        save(['Results\cellwithstacksm1m2_',num2str(fracD),'nbdose',num2str(numD),'delT',num2str(delT),'lf_',num2str(leaking_factor),'_run',num2str(i_sample),'.mat']);
    end
end   
    
end

