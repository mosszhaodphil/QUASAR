% This function adds white noise to signal
% Input parameters:
% input_signal: noise free signal
% snr: signal to noise ratio
% Output:
% noisy_signal: noisy signal

function noisy_signal = add_white_noise(input_signal, snr)

	noisy_signal = awgn(input_signal, snr, 'measured');

end

