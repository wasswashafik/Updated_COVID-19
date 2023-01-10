function [fitresult, gof] = Italy_fit(time, italy)
%CREATEFIT(TIME,ITALY)
%  Create a fit based on the data from the US
%
%  Data for 'Italy_Fit' fit:
%      X Input : time
%      Y Output: italy
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
% for the US data prediction of COVID-19
% Author: Shekhar Vats / Venkata Raju Chundru
% 03/26/2020

%% Fit: 'Italy_Fit'.
[xData, yData] = prepareCurveData( time, italy ); % preparing data for the model

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Algorithm = 'Levenberg-Marquardt';
opts.Display = 'Off';
opts.Normalize = 'on';
opts.Robust = 'LAR';
opts.StartPoint = [14.6118315670169 5.40706646572049];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Italy_Fit' );
h = plot( fitresult, xData, yData );
legend( h, 'italy vs. time', 'Italy_Fit', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'time', 'Interpreter', 'none' );
ylabel( 'italy', 'Interpreter', 'none' );
grid on


