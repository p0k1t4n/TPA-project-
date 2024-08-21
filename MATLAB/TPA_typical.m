clear; clc;

%%

close all;
file_path = 'boiling_final_TPA.xlsx';
[num_data, txt_data, raw_data] = xlsread(file_path);

f=num_data(:,1)./100;
x=num_data(:,2);

hardness = max(f);
xlabel('time(sec)');
plot(x,f,'r*')
hold on;
plot(x,f,'b','linewidth',1.5)
hold on;
yline(max(f),'g--','LineWidth',4);
xlabel('Time (sec)');ylabel('Force (N)');
xlim([0,55]);ylim([0,12]);
title('TPA ( boiling )','FontSize',27);
a=trapz(f(1:35,1));
b=trapz(f(35:64,1));
d=trapz(f(85:115,1));
e=trapz(f(115:143,1));
sum = a+b+d+e;
S = trapz(f);

dist1 = 35;
dist2 = 30;

cohesiveness = (d+e)/(a+b); 
springness = (dist2/dist1);
gumminess = hardness * cohesiveness;
chewiness = (hardness * dist2)/(dist1 * cohesiveness);
ax = gca;
ax.FontSize = 20; 


%% Poaching

close all;

file_path = 'poaching_final_TPA.xlsx';
[num_data, txt_data, raw_data] = xlsread(file_path);

f = num_data(:,2)./100;
t = num_data(:,1);

hardness = max(f);
xlabel('time(sec)');
plot(t,f,'r*')
hold on;
plot(t,f,'b','linewidth',1.5);
hold on;
yline(max(f),'g--','LineWidth',4);
hold on;
xlabel('Time (sec)');ylabel('Force (N)');
xlim([0,50]); ylim([0,12]);
title('TPA ( poaching )','FontSize',27);

a=trapz(f(1:41,1));
b=trapz(f(41:75,1));
d=trapz(f(88:123,1));
e=trapz(f(123:154,1));
sum = a+b+d+e;
S = trapz(f);

dist1 = 41;
dist2 = 35;

cohesiveness = (d+e)/(a+b); 
springness = (dist2/dist1);
gumminess = hardness * cohesiveness;
chewiness = (hardness * dist2)/(dist1 * cohesiveness);

ax = gca;
ax.FontSize = 20; 

