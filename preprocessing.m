clear; clc; close all;
% reading downloaded data from John Hopkins github library
% reference: https://github.com/CSSEGISandData/COVID-19
T=readtable('time_series_covid19_confirmed_global.csv');
T1=readtable('time_series_covid19_deaths_global.csv');
T3=readtable('time_series_covid19_recovered_global.csv');

%% cases
time =1:1:size(T,2); 
for i=5:size(T,2)
    US(i) = str2num(cell2mat(table2cell(T(227,i))));
    Italy(i) = str2num(cell2mat(table2cell(T(139,i))));
    Spain(i) = str2num(cell2mat(table2cell(T(203,i))));
    India(i) = str2num(cell2mat(table2cell(T(133,i))));
end

for i=5:size(T,2)
    for j = 51:83 % taking into account all the provinces in China
    china_tmp(i,j) = str2num(cell2mat(table2cell(T(j,i))));
    end
end
china_total = sum(china_tmp,2);

%% deaths
for i=5:size(T1,2) 
    US_deaths(i) = str2num(cell2mat(table2cell(T1(227,i))));
    italy_deaths(i) = str2num(cell2mat(table2cell(T1(139,i))));
    spain_deaths(i) = str2num(cell2mat(table2cell(T1(203,i))));
    India_deaths(i) = str2num(cell2mat(table2cell(T1(133,i))));
end

for i=5:size(T1,2) % comparison against China with all the provinces
    for j = 51:83 % taking into account all the provinces in China
    china_tmp_deaths(i,j) = str2num(cell2mat(table2cell(T1(j,i))));
    end
end

china_total_deaths = sum(china_tmp_deaths,2);

%% recovery
for i=5:size(T3,2) 
    US_recovery(i) = str2num(cell2mat(table2cell(T3(227,i))));
    italy_recovery(i) = str2num(cell2mat(table2cell(T3(133,i))));
    spain_recovery(i) = str2num(cell2mat(table2cell(T3(201,i))));
    India_recovery(i) = str2num(cell2mat(table2cell(T3(127,i))));
end

for i=5:size(T3,2)
    for j = 42:74 % taking into account all the provinces in China
    china_tmp_recovery(i,j) = str2num(cell2mat(table2cell(T3(j,i))));
    end
end

china_total_recovery = sum(china_tmp_recovery,2);

%% Figure - Cases
figure
plot(US,'LineWidth',2); hold on
plot(china_total,'LineWidth',2);
plot(Italy,'LineWidth',2);
plot(Spain,'LineWidth',2); 
plot(India,'LineWidth',2); grid on
legend('US','China','Italy','Spain', 'India','Location','best');
set(gca,'FontSize',12);
set(gca,'FontWeight','bold');
xlabel('Time [Days]');
ylabel('Number of cases (#)');
title('COVID-19 Total # of Confirmed Cases - March 26 2020');
%% Figure - Deaths
figure
plot(US_deaths,'LineWidth',2); hold on;
plot(china_total_deaths,'LineWidth',2);
plot(italy_deaths,'LineWidth',2);
plot(spain_deaths,'LineWidth',2); 
plot(India_deaths,'LineWidth',2); grid on;
legend('US','China','Italy','Spain', 'India','Location','best');
set(gca,'FontSize',12);
set(gca,'FontWeight','bold');
xlabel('Time (Days)');
ylabel('Number of deaths (-)');
title('Covid 19 total number of deaths - March 26 2020');

%% Figure - Recovery
figure
plot(US_deaths,'LineWidth',2);
hold on
plot(china_total_recovery,'LineWidth',2);
plot(italy_recovery,'LineWidth',2);
plot(spain_recovery,'LineWidth',2); 
plot(India_recovery,'LineWidth',2); grid on; 
legend('US','China','Italy','Spain', 'India','Location','best');
set(gca,'FontSize',12);
set(gca,'FontWeight','bold');
xlabel('Time (Days)');
ylabel('Number of Recovery (-)');
title('Covid 19 total number of Recovery - March 26 2020');