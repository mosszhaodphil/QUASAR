% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)
% M  Günther  (1998) doi: 10.1002/mrm.1284 (MG)

% This function calculates the magnetic relaxation function m(t - tau), eq [6] (MG). tau or t' is bolus arrival time
% Since the term (cos(alpha)) ^ n is considered in AIF calculation, m(t - tau) = exp((-(t - tau)) / T1)

function relaxation_m = calculate_relaxation_m(t)
	tau = 0.8;
	t1  = 3;

	% t = 0.5 : 0.1 : 3;

	relaxation_m = zeros(length(t), 1); % create zero vector for relaxation function values

	for j = 1 : length(t)
		if(t(j) < tau)
			relaxation_m(j) = 0; % relaxation function values remains zero

		elseif (t(j) >= tau)
			relaxation_m(j) = exp((-(t(j) - tau)) / t1);
		
		else
			% do nothing at the moment

		end % end if else

	end % end for loop

end
