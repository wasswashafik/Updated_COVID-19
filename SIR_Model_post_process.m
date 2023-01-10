clear;
close all;
preprocessing;
res = SIR_Model(0.2693,0.1);

plot(res(:,1),res(:,2)*1e6,'LineWidth',2);
hold on
grid on
plot(res(:,1),res(:,3)*1e6,'LineWidth',2);
plot(res(:,1),res(:,4)*1e6,'LineWidth',2);
plot(res(:,1),res(:,5)*1e6,'LineWidth',2);
plot(US,'LineWidth',2);
plot(US_deaths,'LineWidth',2);
legend('Model Suseptible','Model Infected','Model Recovered',...
    'Model Deaths','US actual cases','US actual deaths','Location','best');
title('Number of Covid 19 cases vs time (Model vs US actual data)');
xlabel('Time (Days)');
ylabel('Number of people (-)');
set(gca,'FontWeight','bold');
set(gca,'FontSize',12);