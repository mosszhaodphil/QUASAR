% Function to correct T1 of tissue in Look-locker readout.
% Reference: eq [10] of MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% Input:
% current_ti: current ti value
% Output:
% t1_t_eff: corrected value of T1_t


function t1_t_eff = correct_t1t_look_locker(current_ti)

	load('param_basis.mat');
	load('param_user.mat');

	fa = param_mr_str.flip_angle;
	% fa = (g + delta_g) * fa_nom; currently not used

	% Eq [10]
	t1_t_eff = 1 / (1 / param_user_str.t1_t - log(cos(fa)) / param_mr_str.delta_ti);

end

