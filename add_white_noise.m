% This function adds white noise to signal
% Input parameters:
% input_signal: noise free signal
% snr: signal to noise ratio
% Output:
% noisy_signal: noisy signal

function noisy_signal = add_white_noise(input_signal, snr)
	
	% Check dimension
	if(ndims(input_signal) == 1)
		noisy_signal = awgn(input_signal, snr, 'measured');
	end

	if(ndims(input_signal) == 4)
		[x, y, z, t] = size(input_signal);

		noisy_signal = zeros(x, y, z, t);

		for i = 1 : x
			for j = 1 : y
				for k = 1 : z
					% Get noise free signal
					noise_free_signal = reshape(input_signal(i, j, k, :), [t, 1]);

					% Add noise
					noise_signal = awgn(noise_free_signal, snr, 'measured');

					% Assign noisy signal to new matrix
					noisy_signal(i, j, k, :) = noise_signal;

				end
			end
		end
	end

end

