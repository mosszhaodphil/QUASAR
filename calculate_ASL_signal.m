% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the delta_M ASL signal of eq [12] (ETP)
function delta_M = calculate_ASL_signal(t)

	load('param_basis.mat');
	load('param_user.mat');

	delta_M = zeros(length(t), 1);

	aif_vector = calculate_aif(t); % calculate AIF(t) in eq [12] (ETP)
	residue_R_vector = calculate_residue_R_QUASAR(t); % calculate R(t) in eq[12] (ETP)

	% convert aif_vector to lower triangular matrix
	aif_matrix = convert_to_low_tri(aif_vector);

	% calculate delta_M ASL signal with eq [12] (ETP)
	delta_M = delta_ti * f * aif_matrix * residue_R_vector;
	
end