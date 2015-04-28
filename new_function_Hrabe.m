

function tissue_m = new_function_Hrabe(t)

	load('param_user.mat');
	load('param_basis.mat');

	tissue_m = zeros(length(t), 1);

	k        = 0;
	t1_a_eff = 0;
	t1_t_eff = 0;
	R        = 0;

	for j = 1 : length(t)

		t1_a_eff = correct_t1a_look_locker(t(j));
		t1_t_eff = correct_t1t_look_locker(t(j));
		%k = 1 / t1_a_eff - (1 / t1_t_eff + param_user_str.f / param_mr_str.lamda);
		R = 1 / t1_t_eff - 1 / t1_a_eff;
		F = 2 * param_user_str.inversion_efficiency * param_user_str.m_0a * param_user_str.f / param_mr_str.lamda * exp(- t(j) / t1_t_eff);

		if(t(j) < param_user_str.tau_t)
			tissue_m(j) = 0;
		end

		if(t(j) >= param_user_str.tau_t && t(j) < param_user_str.tau_t + param_mr_str.tau_b)
			tissue_m(j) = F / R * (exp(R * t(j)) - exp(R * param_user_str.tau_t));
			%q = exp(k * t(j)) * (exp(-k * param_user_str.tau_t) - exp(-k * t(j))) / (k * (t(j) - param_user_str.tau_t));
			%tissue_m(j) = 2 * param_user_str.m_0a * param_user_str.f * (t(j) - param_user_str.tau_t) * param_user_str.inversion_efficiency * exp(-t(j) / t1_a_eff) * q;
		end

		if(t(j) >= param_user_str.tau_t + param_mr_str.tau_b)
			tissue_m(j) = F / R * (exp(R * (param_user_str.tau_t + param_mr_str.tau_b)) - exp(R * param_user_str.tau_t));
			%q = exp(k * t(j)) * (exp(-k * param_user_str.tau_t) - exp(-k * (param_user_str.tau_t + param_mr_str.tau_b))) / (k * param_mr_str.tau_b);
			%tissue_m(j) = 2 * param_user_str.m_0a * param_user_str.f * param_mr_str.tau_b * param_user_str.inversion_efficiency * exp(-t(j) / t1_a_eff) * q;

		end
	end

end