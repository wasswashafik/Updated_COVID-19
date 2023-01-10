function [case_US, gof, death_US, gof1, recovery_US, gof2] = US_fit(time, cases, deaths, recovery)
%CREATEFIT(TIME,US)
%  Create a fit based on the data from the US
%
%  Data for 'US_Fit' fit:
%      X Input : time
%      Y Output: US
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
% for the US data prediction of COVID-19
% Author: Shekhar Vats / Venkata Raju Chundru
% 03/26/2020

%% Fit: 'US_Fit'.
delta = length(time) - length(recovery); 
if delta >0
    recovery = [recovery; zeros(length(delta),1)]; 
end
[xData, yData] = prepareCurveData( time, cases ); % preparing data for the model cases
[pData, qData] = prepareCurveData( time, deaths ); % preparing data for the model deaths
[mData, nData] = prepareCurveData( time, recovery ); % preparing data for the model recovery
% Set up fittype and options.
ft = fittype( 'exp1' );% setting the fit type as exponential
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );% setting options for the fit
opts.Algorithm = 'Levenberg-Marquardt'; % fit method type for algorithm
opts.Display = 'Off'; % turning off display for faster processing
opts.Normalize = 'on'; %normalizing
opts.Robust = 'LAR'; 
% % % opts.StartPoint = [14.6118315670169 5.40706646572049];

% Fit model to data.
[case_US, gof] = fit( xData, yData, ft, opts );% fitting the data 
[death_US, gof1] = fit( pData, qData, ft, opts );% fitting the data 
[recovery_US, gof2] = fit( mData, nData, ft, opts );% fitting the data 

% Plot fit with data.
figure( 'Name', 'US_Fit' );
ax(1) = subplot(3,1,1)
h = plot( case_US, xData, yData );
legend( h, 'US COVID Cases vs. Time', 'US_Fit', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Time [days]', 'Interpreter', 'none', 'FontSize', 16 );
ylabel( '# of cases in the US', 'Interpreter', 'none' , 'FontSize', 16 );
grid on; 
title ('COVID-19  Cases in the US', 'FontSize', 24 );

ax(2) = subplot(3,1,2)
h = plot( death_US, pData, qData );
legend( h, 'US COVID Deaths vs. Time', 'US_Fit', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Time [days]', 'Interpreter', 'none', 'FontSize', 16 );
ylabel( '# of deaths in the US', 'Interpreter', 'none' , 'FontSize', 16 );
grid on; 
title ('COVID-19  Deaths in the US', 'FontSize', 24 );

ax(3) = subplot(3,1,3)
h = plot( recovery_US, mData, nData );
legend( h, 'US COVID Recovery vs. Time', 'US_Fit', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Time [days]', 'Interpreter', 'none', 'FontSize', 16 );
ylabel( '# of Recovery in the US', 'Interpreter', 'none' , 'FontSize', 16 );
grid on; 
title ('COVID-19  Recovery in the US', 'FontSize', 24 );


