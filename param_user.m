close all
clear

% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% Variables
% User input variables
f   = 1.2; % CBF
tau = 1; % Bolus arrival time
t1  = 1.1; % tissue relaxation time
t   = 0 : 0.1 : 5; % time variable


% save the these variables in a file
filename = 'param_user.mat';
save(filename);