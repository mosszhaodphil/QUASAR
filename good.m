simulate_QUASAR_ASL;

cd(dir_name);

	PATH = getenv('PATH');

	% FSLDEVDIR PATH for Mac Book
	%FSLDEVDIR_BIN = '/Users/mosszhao/Github/FSL_DEV/bin';
	% FSLDEVDIR PATH for Linux virtual machine
	FSLDEVDIR_BIN = '/home/fsl/Desktop/FSL_DEV/bin';

	% Add FSL command to environment variables
	setenv('PATH', [PATH strcat(':', FSLDEVDIR_BIN)]);

	% input file
	%asl_data_file = 'tc_pv';
	data_file_path = 'tc_pv';


	% 1 No PV correction

	% output file
	output_file_path = strcat('full_no_pvc');

	% option file
	option_file_path = strcat(' ../fabber_options/MATLAB_options_fabber_spatialVB.txt');


	% FABBER COMMAND
	fabber_command = strcat('fabber --data=', data_file_path, ' --data-order=singlefile --mask=mask --output=', output_file_path, ' -@', option_file_path);

	fabber_command

	unix(fabber_command);

	calibration_factor = ' -mul 6000 -div 0.91 -mas ../pvgm_reg';

	cd(output_file_path);

		fslmaths_command = strcat('fslmaths mean_ftiss', calibration_factor, ' perfusion_gm_no');

		fslmaths_command

		unix(fslmaths_command);

	cd('../');

	% 2 PV correction on CBF map
	mkdir('full_LR_on_cbf');

	unix(strcat('asl_file --data=full_no_pvc/perfusion_gm_no --ntis=1 --pvgm=pvgm_reg --pvwm=pvwm_reg --mask=mask --kernel=5  --out=full_LR_on_cbf/perfusion_gm_LR_on_cbf'));

	% 3 PV correction on ASL data
	unix(strcat('asl_file --data=', data_file_path, ' --ntis=78 --pvgm=pvgm_reg --pvwm=pvwm_reg --mask=mask --kernel=5  --out=tc_pv_LR_pvc'));

	unix(strcat('fabber --data=tc_pv_LR_pvc_gm --data-order=singlefile --mask=mask --output=full_LR_on_data -@', option_file_path));
	
	% Calibration
	cd('full_LR_on_data');
		unix(strcat('fslmaths mean_ftiss', calibration_factor, 'perfusion_gm_LR_on_data'));
	cd('../');

	% 3 Spatially regularised PV correction
	output_file_path = strcat('full_spatially_regularised');
	option_file_path = strcat(' ../fabber_options/MATLAB_options_fabber_spatialvb_pvc.txt');
	fabber_command = strcat('fabber --data=', data_file_path, ' --data-order=singlefile --mask=mask --output=', output_file_path, ' -@', option_file_path);

	fabber_command

	unix(fabber_command);

	% Calibration
	cd('full_spatially_regularised');
		unix(strcat('fslmaths mean_ftiss', calibration_factor, ' perfusion_gm_spatial'));
	cd('../');

cd('../');

