% This function makes a 4D matrix whose dimension is (64, 64, 7, 13)
% Input:
% input_vector: timeseries signal of length 13
% position: [x y z] row vector to specifiy the position on matrix_4d
% Output:
% result matrix

function matrix_4D = make_4D_matrix(input_vector, position)

	% Load parameters
	load('param_basis.mat');
	load('param_user.mat');

	% create an empty matrix of size (64, 64, 7, 13)
	matrix_4D = zeros(param_mr_str.m, param_mr_str.m, param_mr_str.n_slices ,length(input_vector));

	% assign the timeseries signal to specified position
	% matrix_4D(position(1), position(2), position(3), :) = input_vector;

	for i = 1 : param_mr_str.m
		for j = 1 : param_mr_str.m
			for k = 1 : param_mr_str.n_slices
				matrix_4D(i, j, k, :) = input_vector;
			end
		end
	end

end
