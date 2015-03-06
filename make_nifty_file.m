% This function makes a nifty file from a 4D of QUASAR ASL signal matrix
% First, a dummy nifty file is loaded
% Secondly, we edit the header of this dummy file
% Thirdly, we copy the content of asl_signal to the signal matrix in dummy file
% Finally, we package the file and return its file handle

function nifty_file_handle = make_nifty_file(signal_4D_matrix)

	% load dummy nifty file
	nifty_file_handle = load_nii('dummy.nii.gz');

	% get the dimension of input matrix
	[x, y, z, t] = size(signal_4D_matrix);

	% modify nifty file header
	% set dimension of 4D nifty matrix
	% x and y are dimension of k space
	% z is the number of slices
	% t is the total number of sampling points
	nifty_file_handle.hdr.dime.dim(2 : 5) = [x, y, z, t];

	% set max and min display intensity in the same range of signal intensity
	nifty_file_handle.hdr.dime.cal_max = max(signal_4D_matrix(:));
	nifty_file_handle.hdr.dime.cal_min = min(signal_4D_matrix(:));

	% assign signal matrix to nifty file
	nifty_file_handle.img = signal_4D_matrix;

end