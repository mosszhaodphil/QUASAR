% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)
% M  Günther  (1998) doi: 10.1002/mrm.1284 (MG)

% This function calculates the magnetic relaxation function m(t - tau_t), eq [6] (MG). tau_t or t' is bolus arrival time to tissue
% Since the term (cos(alpha)) ^ n is considered in AIF calculation, m(t - tau_t) = exp((-(t - tau_t)) / T1)

function relaxation_m = calculate_relaxation_m(t)
	
	load('param_user.mat');
	load('param_basis.mat');

	relaxation_m = zeros(length(t), 1); % create zero vector for relaxation function values

	for j = 1 : length(t)
		if(t(j) < tau_t)
			relaxation_m(j) = 0; % relaxation function values remains zero

		elseif (t(j) >= tau_t)
			relaxation_m(j) = exp((-(t(j) - tau_t)) / t1_t);
		
		else
			% do nothing at the moment

		end % end if else

	end % end for loop

end
