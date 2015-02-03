% This function creates raw QUASAR 4D matrix from crushed and noncrshed signal 4D matrix
% There should be 13 TIs and 7 phasses.
% However, only 6 effective phases as last phase is discarded in quasil (line 285)
% The order of crushed and noncrushed matrices in raw QUASAR 4D matrix is:
% 1 Crushed, 2 Crushed, 3 Noncrushed, 4 Crushed, 5 Crushed, 6 Noncrushed.
% Ref: MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% Input:
% Crushed and Noncrushed signal 4D matrix
% Output:
% raw QUASAR 4D matrix


function raw_QUASAR_matrix = make_raw_QUASAR_matrix(crushed_signal_matrix, noncrushed_signal_matrix)

	% Concatinate matrix along 4th dimension
	raw_QUASAR_matrix = cat(4, crushed_signal_matrix, crushed_signal_matrix, noncrushed_signal_matrix, crushed_signal_matrix, crushed_signal_matrix, noncrushed_signal_matrix);

end

