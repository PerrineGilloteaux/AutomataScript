% Model of O2 diffusion
% Setting parameters so that O2 profile matches reality
% Pixel size is about 15 um (one cell)
%
%clear all, close all;
% gaussf function bugs if multithread
%% Step 1: show O2 diffusion


% Published profile
% PO2 in air = 160 mmHg, or 21%
% PO2 in vessel = 100 mmHg
% PO2 in tissue: blood wall - 83: 933?963, 2003; 10.1152/physrev.00034.2002.
PO2 = [55 31 18 4 2]; %Partial pressure of O2 from blood wall
Pd = [0 5 22 40 69]; % Corresponding distance in um
%mice unasthestized and aesthetized)
PO2m=[21 8 3 1 2.8 3];
Pdm=[5 50 100 150 200 320];
PO2m=PO2m/760*1;
PO2mu=[23 22 8 6 3 3 ];
Pdmu=[5 70 100 150 200 320 ];
PO2mu=PO2mu/760*1;
PO2 = PO2/760*1; % PUt pressure in % O2

% create image with one vessel in middle of image and apply diffusion


dif_cst =2.4;
%dif_cst=sqrt(1.806);
Pscale = 1.18;
blood_density=0.037963;
%blood_density=0.035;
img = newim(21,21);
img(10,10) = 1 ;% Set center at O2 level corresponding to center of vessell
figure
img = min(max(gaussf(img*Pscale,dif_cst),0.001),0.05);
pro = double(img(10,10:end));
plot(0:15:15*10,pro,'r-');hold on ;plot(Pd,PO2,'o'); hold on;
plot(Pdmu,PO2mu,'o'); hold on,
plot(Pdm,PO2m,'o');img(10,10) = 1 ;% Set center at O2 level corresponding to center of vessell
img = newim(21,21);
img(10,10) = 1.5 ;% Set center at O2 level corresponding to center of vessell

img = min(max(gaussf(img*Pscale,dif_cst),0.001),0.05);
pro = double(img(10,10:end));
plot(0:15:15*10,pro,'b-');

img(10,10) = 1.5*1.5 ;% Set center at O2 level corresponding to center of vessell

img = min(max(gaussf(img*Pscale,dif_cst),0.001),0.05);
pro = double(img(10,10:end));
plot(0:15:15*10,pro,'y-');
%legend('Model used','Experimental Data Rats','Experimental Data aesthetized mice','Experimental Data unaesthetized mice');
xlabel('Distance in um from vessel centerline (15=vessel wall)');
ylabel('O2 level');
grid on;




