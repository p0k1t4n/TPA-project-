%% Boiling 二為熱擴散模型

clear; clc; close all;
model=createpde();

%%

a=3; b=1;
R1=[3,4,-b,b,b,-b,a,a,0,0]';
gd=[R1];
sf='R1';
ns=char('R1');
ns=ns';
g=decsg(gd,sf,ns);
geometryFromEdges(model,g);

applyBoundaryCondition(model,"dirichlet","Edge",1,"u",100);
applyBoundaryCondition(model,"dirichlet","Edge",2,"u",100);
applyBoundaryCondition(model,"dirichlet","Edge",3,"u",100);
applyBoundaryCondition(model,"dirichlet","Edge",4,"u",100);

specifyCoefficients(model,"m",0,"d",1,"c",1.84,"a",0,"f",0);
%原本是1.43，要討論參數為何變化這樣

hmax=0.1;
generateMesh(model,"Hmax",hmax);
%figure(2)
%pdemesh(model);

u0 = 25;    %雞肉初溫

setInitialConditions(model,u0);
T = 1.5;     %控制熟度 
nT = 300;     %計算時長
tlist = linspace(0,T,nT);
results = solvepde(model,tlist);
u = results.NodalSolution;


umax=max(max(u));umin=min(min(u));
tic
for i = 1 : nT
   figure(1)
    pdeplot(model,"XYData",u(:,i),'ColorMap','jet','Mesh','off')
    period = toc;
    title(['Solved time ',num2str(period),' s']);
    caxis([umin,umax]);xlabel("x");ylabel("y");zlabel('WaveFun');
    M(i)=getframe;
end

period

u1=u(:,300);

% 找到向量中的最小值及其位置
[min_value, min_index] = min(u1);

% 找出最小值和其位置
fprintf('最小值: %d\n', min_value);
fprintf('位置: %d\n', min_index);

time=1:300;
model_core = u(min_index,:);
figure(2)
plot(time,model_core);
hold on;

%%
close all;
clc;
original_weight = 10.5;
original_moisture = 7.88;
time_b = [0 3 6 9 12 15];
water_weight_b = [7.88 6.15 5.85 5.55 5.19 5]; % sample weight
%moisture = (water_weight_b / original_weight) * 100 ;
moisture_b = [75.05 58.57 53.8 51.2 49.43 47.62];
temperature_b = [25 82.5 98 98.55 98.95 98.9]; % sample core weight
temperature_model_b = [25 82.59 97.53 99.63 99.95 100]; % diffusion core temp

N = 300;
T_b = linspace(0,max(time_b),N);
W_b = interp1(time_b,moisture_b,T_b,'spline'); % 內插法將點連起來（重量）
%Temp_b = interp1(time_b,temperature_b,T_b,'spline');  % 內插法將點連起來（核心溫度）
Temp_model_b = interp1(time_b,temperature_model_b,T_b,'spline');  % 內插法將點連起來（模擬溫度）

figure(3)
yyaxis right
plot(T_b,W_b,'k-','LineWidth',3.2);
hold on;
plot(time_b,moisture_b,'bo','MarkerFaceColor','b','MarkerSize',12);
xlabel('Time (min)','FontSize',20); 
ylabel('Moisture content (%)','FontSize',20);
ylim([min(moisture_b)-5,max(moisture_b)+5]);
ax = gca;
ax.FontSize = 20; 
hold on;

yyaxis left
ylabel('Core Temperature (°C)','FontSize',20)
ylim([5,105]);
tt = linspace(0,15,N);
plot(tt,model_core,'g-','LineWidth',3.2);
hold on;
plot(time_b,temperature_b,'r diamond','MarkerFaceColor','r','MarkerSize',12);
hold on;
title('Water content V.S Temp ( Boiling )','FontSize',27);
legend('Core temp curve (simulated)','Sample core Temp',...
    ' Moisture (interpl)','Moisture content');
ax.YAxis(1).Color = 'r';
ax.YAxis(2).Color = 'b';
