% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the delivery function c(t), eq [9] (ETP)
function delivery_Buxton = calculate_delivery_Buxton(t)

	load('param_basis.mat');
	load('param_user.mat');

	delivery_Buxton = zeros(length(t), 1);
	aif_dispersion = zeros(length(t), 1);

	% calculate dispersion
	switch dispersion_type
		case 1 % eq [6] (MACQ)
			aif_dispersion = calculate_aif_no_dispersion(t); % calculate dispersion effect of AIF
		otherwise
			% do nothing now
	end

	% calculate deliver function c(t), eq [5] (MACQ)
	for j = 1 : length(t)
		delivery_Buxton(j) = exp((-t(j)) / t1_a) * aif_dispersion(j);
	end

end

