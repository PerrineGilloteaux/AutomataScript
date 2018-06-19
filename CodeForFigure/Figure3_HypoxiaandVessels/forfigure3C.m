% Figure 3C Probability of vessel survival
figure
addpath('../Common');
dose = [7, 11, 13 15 17 25] ;
death = 1- [0 0.18 0.23 0.26 0.43 0.62];
plot(0:35,1-arrayfun(@vessel_death,0:35)); hold on,
plot(dose,death,'o');
xlabel('Dose in Gy');
ylabel ('1-vesseldeathproba');
title('Probability of Vessel Survival with one exposure');
