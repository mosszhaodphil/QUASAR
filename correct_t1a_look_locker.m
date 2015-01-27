% Function to correct T1 of arterial blood in Look-locker readout.
% Reference: eq [11] of MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% Input:
% current_ti: current ti value
% Output:
% t1_a_eff: corrected value of T1_a


function t1_a_eff = correct_t1a_look_locker(current_ti)

	load('param_basis.mat');
	load('param_user.mat');

	fa = param_mr_str.flip_angle;
	% fa = (g + delta_g) * fa_nom; currently not used

	% Eq [11]
	if(current_ti < param_user_str.tau_m)
		t1_a_eff = param_user_str.t1_a;

	else
		t1_a_eff = 1 / (1 / param_user_str.t1_a - log(cos(fa)) / param_mr_str.delta_ti);

	end

end

