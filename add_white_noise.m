% This function adds white noise to signal
% Input parameters:
% input_matrix: noise free 4D matrix
% snr: signal to noise ratio
% Output:
% noise_matrix: noisy signal

function noise_matrix = add_white_noise(input_matrix, snr)

	[x, y, z, t] = size(input_matrix);

	noise_matrix = zeros(x, y, z, t);

	for i = 1 : x
		for j = 1 : y
			for k = 1 : z
				input_signal = input_matrix(i, j, k, :);
				noise_signal = awgn(input_signal(:), snr, 'measured');
				noise_matrix(i, j, k, :) = noise_signal;
			end
		end
	end

end

