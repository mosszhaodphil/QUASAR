% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the delivery function c(t), eq [9] (ETP)
function delivery = calculate_delivery(t)

	load('param_basis.mat');
	load('param_user.mat');

	delta_M_ncr = calculate_delta_M_noncrush(t);
	delta_M_cr = calculate_delta_M_crush(t);
	delta_M_diff = delta_M_ncr - delta_M_cr; % variable to save the difference of noncrushed and crushed ASL signal

	integration_delta_M = zeros(length(t), 1); % this variable saves the integration part of eq [9]


	% calculate integration_delta_M
	integration_delta_M(1) = delta_ti * delta_M_diff(1);

	for j = 2 : length(t)
		integration_delta_M(j) = delta_ti * delta_M_diff(j) + integration_delta_M(j - 1);

	end

	% calculate delivery c(t)
	% the function is simplified by reducing exp(1 / t_1a) term
	for j = 1 : length(t)
		if(t(j) < tau) % before bolus arrival time
			delivery(j) = 0;

		elseif(t(j) >= tau) % after bolus arrival time
			delivery(j) = (delta_M_diff(j) / integration_delta_M(j)) * (exp(-(1 + (t(j) - tau)) / t1_a)) * tau_b;
	 	else
			% do nothing at the moment
	 	end
	end

end

