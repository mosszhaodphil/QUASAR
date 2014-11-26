close all
clear

% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% Variables
% MRI scan variables

m0a; % m0a is measured in single voxel of sagittal sinus of most superior slice
r2a_star = 18.8; % r2a_star = 1 / T2a_star; T2a_star is the T2_star of arterial (ETP)
r2v_star = 46.2; % r2a_star = 1 / T2v_star; T2a_star is the T2_star of vascular (ETP)
alpha    = 0.91; % inversion efficiency (ETP)
m0v = m0v * 1.73; % 1.73 is conversion factor based on r2v_star, r2a_star, and alpha (ETP)

t1a = 1.65; % T1 of arterial (ETP)
n = 2; % eq [7] (ETP)