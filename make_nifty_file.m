% This function makes a nifty file from a vector of QUASAR ASL signal
% First, a dummy nifty file is loaded
% Secondly, we edit the header of this dummy file
% Thirdly, we copy the content of asl_signal to the signal matrix in dummy file
% Finally, we package the file and return its file handle
% asl_signal is a vector of delta_M QUASAR signal

function nifty_file_handle = make_nifty_file(asl_signal)

	% Load parameters
	load('param_basis.mat');
	load('param_user.mat');

	% load dummy nifty file
	nifty_file_handle = load_nii('dummy.nii.gz');

	% Compute effective t dimension of nifty file
	effective_slices = param_mr_str.n_slices - 1; % last slice (phase) is discarded in quasil
	% The total number of element on t dimension is number of TIs of each slice (phase)
	% multiply by total number of effective slices(phases)
	t_dimension_length = effective_slices * length(asl_signal);

	% modify nifty file header
	% set dimension of 4D nifty matrix
	% x and y are dimension of k space
	% z is the number of slices
	% t is the total number of sampling points
	nifty_file_handle.hdr.dime.dim(2 : 5) = [param_mr_str.m, param_mr_str.m, param_mr_str.n_slices, t_dimension_length];

	% set max and min display intensity in the same range of signal intensity
	nifty_file_handle.hdr.dime.cal_max = max(asl_signal);
	nifty_file_handle.hdr.dime.cal_min = min(asl_signal);

	% create an empty matrix based on dimension in header
	asl_signal_matrix = zeros(param_mr_str.m, param_mr_str.m, param_mr_str.n_slices, t_dimension_length);

	% we assign asl_signal to be the element at middle of first slice
	asl_signal_matrix(param_mr_str.m / 2, param_mr_str.m / 2, 1, 1 : length(asl_signal)) = asl_signal;

	% assign signal matrix to nifty file
	nifty_file_handle.img = asl_signal_matrix;

end