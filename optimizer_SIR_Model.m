clc;
clear;
%% SCRIPT to fit the SIR model to US data
preprocessing;
close all;
%[t,xa] = SIR_Model(1e-4,1e-4,0);

time_sim = length(US);
fun = @(x)residual(x,US);
%x0 = [0.33;1/5];
x0 = [0.2598;0.1];
%options = optimoptions('fminunc','Algorithm','quasi-newton');
options = optimoptions(@lsqnonlin,'Algorithm','trust-region-reflective',...
    'Display','iter','FunctionTolerance',1e-7);
%options.Display = 'iter';
res=fun(x0);
[x, fval, exitflag, output] = lsqnonlin(fun,x0,[0,1/10],[],options);

t=res(:,1);
xa=res(:,2:end);

% figure;
% plot(t,xa(:,1),'LineWidth',2);
% hold on;
% grid on;
% plot(t,xa(:,2),'LineWidth',2);
% plot(t,xa(:,3),'LineWidth',2);
% legend('Suseptable population','Infected','Recovered','Location','best');


figure
plot(US);
hold on;
plot(t,xa(:,2),'LineWidth',2);

function res = residual(x,US)
fun1 = @(x)SIR_Model(x(1),x(2));
y=fun1(x);
plot(US);
hold on;
plot(y(:,1),y(:,3)*1e6);
t=1:1:length(US);
model = interp1(y(:,1),y(:,3),t);
err=US - model*1e6;
plot(err);
res=err;
end