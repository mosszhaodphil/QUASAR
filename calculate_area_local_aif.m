% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the areal of local AIF, numerator (integration) of eq [10] (ETP)
function area = calculat_area_local_aif(t)

	load ('param_basis.mat');

	area = abv * 2 * m_a0 * tau_b * alpha;

end