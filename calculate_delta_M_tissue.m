% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)
% RB Buxton (1998) doi: 10.1002/mrm.1910400308 (RBB)

% This function calculates ASL signal deltaM of tissue using Buxton's model (RBB)
% The same method is also used in equation [5] of (MACQ)
% delta_M_tissue = 2 * alpha * M0a * f * (c(t) * r(t) * m(t))
% c(t) = exp(-1 / T1a) * a(t)
% a(t) depends on dispersion

function delta_M_tissue = calculate_delta_M_tissue(t)

	load('param_user.mat');
	load('param_basis.mat');

	delta_M_tissue       = zeros(length(t), 1); % ASL signal of tissue
	input_function       = zeros(length(t), 1); % c(t) of (MACQ)
	residue_buxton       = zeros(length(t), 1); % r(t) of (MACQ)
	magnetization_buxton = zeros(length(t), 1); % m(t) of (MACQ)

	% calculate c(t)
	input_function = calculate_delivery_tissue_Buxton(t);

	% calculate r(t)
	residue_buxton = calculate_residue_r_Buxton(t);

	% calculate m(t)
	magnetization_buxton = calculate_relaxation_m(t);


	for j = 1 : length(t)
		% calculate ASL signal
		delta_M_tissue(j) = 2 * inversion_efficiency * m_0a * f * conv(input_function(j), residue_buxton(j) * magnetization_buxton(j));
	end

end

