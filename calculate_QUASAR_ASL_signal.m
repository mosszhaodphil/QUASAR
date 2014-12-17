% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the QUASAR ASL signal
% Because we are simulating a model based QUASAR ASL signal, we may simply use tissue kinetic curve to calculate QUASAR ASL signal
% Thus we apply eq [5] of (MACQ) delta_M_t(t)
function delta_M = calculate_QUASAR_ASL_signal(t)

	delta_M = calculate_delta_M_tissue(t);
	
end