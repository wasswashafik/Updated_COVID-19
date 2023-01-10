clc;
preprocessing
close all;
a = 3.55;
b = 5.737;

[x,y]= Italy_fit([time], US);

time2 = [time,69:70];
y1 = x(time2);

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




