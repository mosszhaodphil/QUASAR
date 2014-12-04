% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)
% M  Günther  (1998) doi: 10.1002/mrm.1284 (MG)

% This function calculates the residue function r(t - tau), eq [2] (MG). tau or t' is bolus arrival time

function residue_r = calculate_residue_r_Buxton(t)

	tau   = 0.8;
	lamda = 0.9;
	f     = 0.2;

	t = 0.5 : 0.1 : 3;

	residue_r = zeros(length(t), 1); % create zero vector for residue function values

	for j = 1 : length(residue_r)
		if(t(j) < tau)
			residue_r(j) = 0; % residue function values remains zero

		elseif (t(j) >= tau)
			residue_r(j) = exp((-(t(j) - tau)) * f / lamda);
		
		else
			% do nothing at the moment

		end % end if else

	end % end for loop

end
