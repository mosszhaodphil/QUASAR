% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

% This function calculates the arterial input function a(t) when there is no dispersion, eq [6] (MAQ)
% tau or delta_t_a is bolus arrival time

function aif_dispersion = calculate_aif_no_dispersion(t)

	load('param_user.mat');
	load('param_basis.mat');

	aif_dispersion = zeros(length(t), 1); % create zero vector for residue function values

	for j = 1 : length(t)
		if(t(j) < tau)
			aif_dispersion(j) = 0; % residue function values remains zero

		elseif (t(j) >= tau)
			aif_dispersion(j) = 1;
		
		else
			% do nothing at the moment

		end % end if else

	end % end for loop

end
