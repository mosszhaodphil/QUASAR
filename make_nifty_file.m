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

	% modify nifty file header
	% set dimension of 4D nifty matrix
	% x and y are dimension of k space
	% z is the number of slices
	% t is the total number of sampling points
	nifty_file_handle.hdr.dime.dim(2 : 5) = [m, m, n_slices, length(t)];

	% set max and min display intensity in the same range of signal intensity
	nifty_file_handle.hdr.dime.cal_max = max(asl_signal);
	nifty_file_handle.hdr.dime.cal_min = min(asl_signal);

	% create an empty matrix based on dimension in header
	asl_signal_matrix = zeros(m, m, n_slices, length(t));

	% we assign asl_signal to be the element at middle of first slice
	asl_signal_matrix(m / 2, m / 2, 1, :) = asl_signal;

	% assign signal matrix to nifty file
	nifty_file_handle.img = asl_signal_matrix;

end