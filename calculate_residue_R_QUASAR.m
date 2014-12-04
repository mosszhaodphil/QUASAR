% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the residue function R(t - tau) eq [6] (ETP) without CBF term.
% R(t - tau) = r(t - tau) * m(t - tau)

function residue_R = calculate_residue_R_QUASAR(t)

	t = 0 : 0.1 : 5; % Hard code, this line should be deleted

	residue_R = zeros(length(t), 1); % initiate residue array

	residue_r_Buxton = calculate_residue_r_Buxton(t); % calculate r(t - tau)
	relaxation_m     = calculate_relaxation_m(t); % calculate m(t - tau)

	for j = 1: length(t)

		residue_R(j) = residue_r_Buxton(j) * relaxation_m(j); % eq [6] (ETP) without CBF term

	end

end
