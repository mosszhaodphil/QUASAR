% This function creates mask matrix
% Input:
% x, y, z : size of matrix
% Output:
% mask_matrix

function mask_matrix = make_mask_matrix(x, y, z)

	mask_matrix = ones(x, y, z);

	for i = 1 : x
		for j = 1 : y
			for k = 1 : z
				mask_matrix(i, j, k) = 100 + i * j * k;
			end
		end
	end


end

