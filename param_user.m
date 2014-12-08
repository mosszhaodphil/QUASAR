close all
clear

% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% Variables
% User input variables
f   = 32; % CBF
arterial_blood_volume = 0.81; % arterial blood volume
tau = 1; % Bolus arrival time
t1  = 1.3; % T1 relaxation of tissue
t   = 0 : 0.1 : 5; % time variable
m_0a = 1; % equilibrium magnetization of arterial blood
inversion_efficiency = 0.9; % inversion efficiency alpha
crush_efficiency = 0.35; % percentage of arterial blood signal removed

dispersion_type = 1; % no dispersion


% save the these variables in a file
filename = 'param_user.mat';
save(filename);