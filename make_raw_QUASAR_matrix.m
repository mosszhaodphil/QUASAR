% This function creates raw QUASAR 4D matrix from crushed and noncrshed signal 4D matrix
% There should be 13 TIs and 7 phasses.
% However, only 6 effective phases as last phase is discarded in quasil (line 285)
% The order of crushed and noncrushed matrices in raw QUASAR 4D matrix is:
% 1 Crushed, 2 Crushed, 3 Noncrushed, 4 Crushed, 5 Crushed, 6 Noncrushed.
% Ref: MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% Input:
% Tissue and blood asl 4D matrix
% Output:
% raw QUASAR 4D matrix


function raw_QUASAR_matrix = make_raw_QUASAR_matrix(tissue_asl_matrix, blood_asl_matrix)

	load('param_user.mat');
	load('param_basis.mat');

	suppression_effect = zeros(6, 1); % suppression effect Sc(a,s) of eq [3] (MACQ)

	% compute suppression effect of different flow directions
	for i = 1 : length(suppression_effect)
		dot_product = dot(param_mr_str.polar_angle, param_mr_str.s(:, i)); % compute the dot product

		% Implementatin of Sc(a,s) = 1 - max(a . s, 0) eq [3] of (MACQ)
		if(dot_product > 0)
			suppression_effect(i) = 1 - dot_product;
		else
			suppression_effect(i) = 1 - 0;
		end
	end

	% Compute the signal of various cycles of flow suppression, eq [2] (MACQ)
	cycle_1 = tissue_asl_matrix + suppression_effect(1) * blood_asl_matrix;
	cycle_2 = tissue_asl_matrix + suppression_effect(2) * blood_asl_matrix;
	cycle_3 = tissue_asl_matrix + suppression_effect(3) * blood_asl_matrix;
	cycle_4 = tissue_asl_matrix + suppression_effect(4) * blood_asl_matrix;
	cycle_5 = tissue_asl_matrix + suppression_effect(5) * blood_asl_matrix;
	cycle_6 = tissue_asl_matrix + suppression_effect(6) * blood_asl_matrix;

	% Concatinate matrix along 4th dimension
	raw_QUASAR_matrix = cat(4, cycle_1, cycle_2, cycle_3, cycle_4, cycle_5, cycle_6);

end

