clear; clc;

%%
[b_num_data, b_txt_data, b_raw_data] = xlsread('boiling_final_dist.xlsx');
figure(1)
f_b = b_num_data(:,2)./100;
x_b = b_num_data(:,1);
plot(x_b,f_b,'b','LineWidth',3.2);
hold on;
plot(x_b,f_b,'ro','MarkerSize',9,'MarkerFaceColor','r');
title('Elasticity test (Boiling)','FontSize',27)
ylabel('Force (N)');
xlabel('Displacement (mm)');

ax = gca;
ax.FontSize = 20; 

%%
close all;
[p_num_data, p_txt_data, p_raw_data] = xlsread("poaching_final_dist.xlsx");
figure(2)
f_p = p_num_data(:,1)./100;
x_p = p_num_data(:,2);
plot(f_p,x_p,'b','LineWidth',3.2);
hold on;
plot(f_p,x_p,'ro','MarkerSize',9,'MarkerFaceColor','r');
title('Elasticity test (Poaching)','FontSize',27)
ylabel('Force (N)');
xlabel('Displacement (mm)');

ax = gca;
ax.FontSize = 20; 


