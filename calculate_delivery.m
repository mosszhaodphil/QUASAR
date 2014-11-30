% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the delivery function c(t), eq [9] (ETP)
function delivery = calculate_delivery(t)

	load ('param_basis.mat');

	delivery = (deltaM_function / integration) * exp(-(1 + (tau_m - tau_a)) / t1a) * tau_b; % eq [9]

end