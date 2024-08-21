%%
clear;
close all;
clc;
original_weight = 10.5;
original_moisture = 7.88; % 10.5 * 75% = 7.88 (g)
time = [0 3 6 9 12 15];
water_weight_p = [7.88 7.88 7.78 7.71 7.01 6.45]; % sample weight
%%
close all;
%moisture = (water_weight_b / original_weight) * 100 ;
moisture_p = [75.05 75.05 74.1 71.5 66.76 61.43];
sample_temp_p = [25 31.6 40.6 53.4 66.9 75.1]; % sample core weight
temperature_reservoir_p = [25.2 36.5 47.7 58.4 74.2 75.9]; % diffusion core temp

N = 300;
T_p = linspace(0,max(time),N);
W_p = interp1(time,moisture_p,T_p,'spline'); % 內插法將點連起來（重量）
Temp_p = interp1(time,sample_temp_p,T_p,'spline');  % 內插法將點連起來（核心溫度）
Temp_reservoir_p = interp1(time,temperature_reservoir_p,T_p,'spline');  % 內插法將點連起來（模擬溫度）

figure(3)
yyaxis right
plot(T_p,W_p,'k-','LineWidth',3.2);
hold on;
plot(time,moisture_p,'bo','MarkerFaceColor','b','MarkerSize',12);
xlabel('Time (min)','FontSize',20); 
ylabel('Moisture content (%)','FontSize',20);
ylim([45,80]);
ax = gca;
ax.FontSize = 20; 
hold on;

yyaxis left
ylabel('Core Temperature (°C)','FontSize',20)
ylim([5,105]);
plot(T_p,Temp_p,'g-','LineWidth',3.2);
hold on;
plot(time,sample_temp_p,'r diamond','MarkerFaceColor','r','MarkerSize',12);

title('Water content V.S Temp ( Poaching )','FontSize',27);
legend('Core temp curve (simulated)','Sample core Temp',...
    ' Moisture (interpl)','Moisture content');
ax.YAxis(1).Color = 'r';
ax.YAxis(2).Color = 'b';