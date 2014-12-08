% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)
% M  Günther  (1998) doi: 10.1002/mrm.1284 (MG)

% This function calculates the ASL signal (control minus label) delta_M, eq [12] (ETP)
% delta_M = delta_ti * f * AIF * R

function delta_M = calculate_delta_M(t)
	
	load('param_user.mat');
	load('param_basis.mat');

	residue_R = calculate_residue_R_QUASAR(t); % calculate residue R
	aif       = calculate_aif(t); % calculate arterial input function AIF

	aif_triangle = convert_to_low_tri(aif); % convert AIF to lower triangluar matrix as in eq [12] of (ETP)

	delta_M = delta_ti * f * aif_triangle * residue_R;

end
