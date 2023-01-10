clc;
preprocessing
close all;
a =11.66; % from US Fit data
b = 5.252; % from US Fit data

[case_US, stats_case, death_US, stats_death, recovery_US, stats_recovery]  = US_fit(time', US', US_deaths', US_recovery');

time2 = [time,size(T,2):size(T,2)+10];
y1 = case_US(time2); % cases prediction
y2 = death_US(time2); % deaths prediction
y3 = recovery_US(time2); % recovery prediction
%% cases prediction
figure;
plot(time2,y1,'--o','LineWidth',2);
hold on;
grid on;
plot(time,US,'*');
legend('US Projected','US present','Location','best');
set(gca,'FontSize',12);
set(gca,'FontWeight','bold');
xlabel('Time (Days)');
ylabel('Number of Confirmed Cases (-)');
title('Covid 19 number of cases projected (March 24 2020)');

%% deaths prediction

figure;
plot(time2,y2,'--o','LineWidth',2); hold on; grid on;
plot(time,US_deaths,'*');
legend('US Projected','US present','Location','best');
set(gca,'FontSize',12); set(gca,'FontWeight','bold');
xlabel('Time (Days)'); ylabel('Number of Confirmed Deaths (-)');
title('Covid 19 number of deaths projected (March 26 2020)');

%% recovery prediction
figure;
plot(time2,y3,'--o','LineWidth',2); hold on; grid on;
plot(time(2:end),US_recovery,'*');
legend('US Projected','US present','Location','best');
set(gca,'FontSize',12); set(gca,'FontWeight','bold');
xlabel('Time (Days)'); ylabel('Number of Confirmed Recovery (-)');
title('Covid 19 number of recovery projected (March 26 2020)');


