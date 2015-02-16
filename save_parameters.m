% This function saves the parameters of the current situation to a text file


function [] = save_parameters()

	load('param_basis.mat');
	load('param_user.mat');

	format bank;

	file_handle = fopen('parameters.txt', 'wt');

	fprintf(file_handle, '****************************\n');
	fprintf(file_handle, 'Simulation Parameters\n');
	fprintf(file_handle, '****************************\n\n');

	fprintf(file_handle, 'CBF: %.2f \n', param_user_str.f * 6000);
	fprintf(file_handle, 'ABV: %.2f%% \n', param_user_str.arterial_blood_volume * 100);
	fprintf(file_handle, 'Bolus duration: %.2f \n', param_mr_str.tau_b);
	fprintf(file_handle, 'Bolus Arrival Time Tissue: %.2f \n', param_user_str.tau_t);
	fprintf(file_handle, 'Bolus Arrival Time Arterial Blood: %.2f \n', param_user_str.tau_m);
	fprintf(file_handle, 'T1 Tissue: %.2f \n', param_user_str.t1_t);
	fprintf(file_handle, 'T1 Arterial Blood: %.2f \n', param_user_str.t1_a);
	fprintf(file_handle, 'M0 Arterial blood: %.2f \n', param_user_str.m_0a);
	fprintf(file_handle, 'Inversion efficiency: %.2f \n', param_user_str.inversion_efficiency);
	fprintf(file_handle, 'Blood tissue partition coefficient: %.2f \n', param_mr_str.lamda);
	
	fprintf(file_handle, '\n');

	fprintf(file_handle, 'Flip angle: %.2f \n', radtodeg(param_mr_str.flip_angle));
	fprintf(file_handle, 'Flow suppression angle phi: %.2f \n', radtodeg(param_mr_str.phi));
	fprintf(file_handle, 'Flow suppression angle theta: %.2f \n', radtodeg(param_mr_str.theta));
	fprintf(file_handle, 'g: %.2f \n', param_mr_str.g);
	fprintf(file_handle, 'delta_g: %.4f \n', param_mr_str.delta_g);

	fprintf(file_handle, '\n');
	fprintf(file_handle, 'Delta TI: %.2f \n', param_mr_str.delta_ti);
	fprintf(file_handle, 'Inversion Time (TI): %.2f \n', param_user_str.t);

	fprintf(file_handle, '\n\n');
	fprintf(file_handle, '****************************\n');
	fprintf(file_handle, 'End\n');
	fprintf(file_handle, '****************************\n');

	fclose(file_handle);

end
