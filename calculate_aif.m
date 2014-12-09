% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the artierial input function AIF, eq [8] (ETP)
function aif = calculate_aif(t)

	load('param_basis.mat');
	load('param_user.mat');

	n   = zeros(length(t), 1);
	aif = zeros(length(t), 1);

	delivery_c = calculate_delivery_Buxton(t); % calculate delivery function c(t)

	for j = 1 : length(t)
		% calculate n
		if(t(j) < tau)
			n(j) = 0;
		elseif (t(j) >= tau)
			n(j) = floor((t(j) - tau) / delta_ti);
		end
		
		% calculate AIF
		aif(j) = 2 * m_0a * inversion_efficiency * (cos(flip_angle)) ^ n(j) * delivery_c(j); % eq [8]

	end
end