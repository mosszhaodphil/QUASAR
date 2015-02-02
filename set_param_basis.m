% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

function [] = set_param_basis()

	% Variables
	% MRI scan variables
	param_mr_str             = struct;
	param_mr_str.n_slices    = 7; % total number of slices (ETP)
	param_mr_str.n_scans     = 40; % 40 control/label scan pairs (ETP)
	param_mr_str.n_acq       = 18; % number of acquisition time points (ETP)
	param_mr_str.slide_gap   = 2; % slide gap of 2mm (ETP)
	param_mr_str.m           = 64; % dimension of matrix 64x64 (ETP)
	param_mr_str.fov         = 240; % field of view 240mm (ETP)
	param_mr_str.flip_angle  = 2 * pi / 360 * 30; % flip angle of 30 degrees (ETP)
	param_mr_str.g           = 1; % g value derived from saturation recovery of ASL control images (MACQ)
	param_mr_str.delta_g     = 0.023; % delta_g factor to correct flip angle (personal communication with Petersen) (MACQ)
	param_mr_str.tr          = 4; % repitition time 4000ms (ETP)
	param_mr_str.te          = 0.023; % echo time 23ms (ETP)
	param_mr_str.ti1         = 0.05; % TI1 or labeling delay of 50ms, figre 2 (ETP)
	param_mr_str.delta_ti    = 0.30; % interval between excitation pulses, figure 2 (ETP)
	param_mr_str.tau_b       = 0.64; % bolus duration time (MACQ)
	param_mr_str.tau_s       = 2.25; % bolus saturation duration time (ETP)
	param_mr_str.gap         = 30; % slice inversion gap (ETP)
	param_mr_str.width_in_sl = 150; % inversion slab width (ETP)
	param_mr_str.v_enc       = [3]; % velocity of bipolar gradients at 3cm/s (ETP)
	param_mr_str.lamda       = 0.9; % blood tissue partition coefficient (ETP)

	% save the these variables in a file
	filename = 'param_basis.mat';
	save(filename, 'param_mr_str');

end

