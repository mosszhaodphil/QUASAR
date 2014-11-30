% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the artierial input function AIF, eq [8] (ETP)
function aif = calculate_aif(t)

	load ('param_basis.mat');

	c = calculate_delivery(t); % calculate delivery function c(t)

	aif = 2 * m_a0 * alpha * (cos(flip_angle)) ^ n * c; % eq [8]

end