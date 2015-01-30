

function dir_name = save_asl_signal_gui(current_handle)

	load('param_user.mat');

	quasar_asl_signal     = current_handle.quasar_asl_signal;
	blood_asl_signal      = current_handle.blood_asl_signal;
	crushed_asl_signal    = current_handle.crushed_asl_signal;
	noncrushed_asl_signal = current_handle.noncrushed_asl_signal;
	aif_asl_signal        = current_handle.aif_asl_signal;

	% The output is a saved in the folder output_yyyymmdd_HHMMSS under the same directory
	date_time_format = 'yyyymmdd_HHMMSS'; % date and time format
	date_time_now    = clock; % get vector of current time
	date_time        = datestr(date_time_now, date_time_format); % convert current time vector to string
	dir_name         = strcat('output_', date_time); % Default directory name

	file_name_quasar     = 'signal_quasar'; % file name to save QUASAR (Tissue) ASL signal
	file_name_blood      = 'signal_blood'; % file name to save Blood ASL signal
	file_name_crushed    = 'signal_crushed'; % file name to save crushed ASL signal
	file_name_noncrushed = 'signal_noncrushed'; % file name to save noncrushed ASL signal
	file_name_aif        = 'signal_aif'; % file name to save AIF ASL signal
	file_type_txt        = '.txt'; % text file extension
	file_type_nifty      = '.nii.gz'; % nifty file extension

	% QUASAR (Tissue) ASL signal
	quasar_nifty_file_handle = make_nifty_file(quasar_asl_signal); % make nifty file from QUASAR ASL signal
	quasar_asl_figure_handle = plot_quasar_signal(quasar_asl_signal, param_user_str.t); % plot the signal over time

	% Blood ASL signal and save it to file
	blood_nifty_file_handle = make_nifty_file(blood_asl_signal); % make nifty file from Blood ASL signal
	blood_asl_figure_handle = plot_blood_signal(blood_asl_signal, param_user_str.t); % plot the signal over time

	% Crushed ASL signal and save it to file
	crushed_nifty_file_handle = make_nifty_file(crushed_asl_signal); % make nifty file from Crushed ASL signal
	crushed_asl_figure_handle = plot_crushed_signal(crushed_asl_signal, param_user_str.t); % plot the signal over time

	% Noncrushed ASL signal and save it to file
	noncrushed_nifty_file_handle = make_nifty_file(noncrushed_asl_signal); % make nifty file from Noncrushed ASL signal
	noncrushed_asl_figure_handle = plot_noncrushed_signal(noncrushed_asl_signal, param_user_str.t); % plot the signal over time

	% AIF ASL signal and save it to file
	aif_nifty_file_handle = make_nifty_file(aif_asl_signal); % make nifty file from Noncrushed ASL signal
	aif_asl_figure_handle = plot_aif_signal(aif_asl_signal, param_user_str.t); % plot the signal over time

	% Plot summary curve (4x4) of four signals
	summary_figure_handle = subplot_signal([quasar_asl_signal blood_asl_signal crushed_asl_signal noncrushed_asl_signal], param_user_str.t);

	% Save simulated ASL data file in the new directory
	mkdir(dir_name);
	cd(dir_name);

	dlmwrite(strcat(file_name_quasar, file_type_txt), quasar_asl_signal); % save QUASAR ASL data to a text file
	save_nii(quasar_nifty_file_handle, strcat(file_name_quasar, file_type_nifty)); % save QUASAR ASL nifty file
	print(quasar_asl_figure_handle, '-dpng', file_name_quasar, '-r300'); % save QUASAR ASL signal time series figure

	dlmwrite(strcat(file_name_blood, file_type_txt), blood_asl_signal); % save blood ASL data to a text file
	save_nii(blood_nifty_file_handle, strcat(file_name_blood, file_type_nifty)); % save blood ASL nifty file
	print(blood_asl_figure_handle, '-dpng', file_name_blood, '-r300'); % save blood ASL signal time series figure

	dlmwrite(strcat(file_name_crushed, file_type_txt), crushed_asl_signal); % save crushed ASL data to a text file
	save_nii(crushed_nifty_file_handle, strcat(file_name_crushed, file_type_nifty)); % save crushed ASL nifty file
	print(crushed_asl_figure_handle, '-dpng', file_name_crushed, '-r300'); % save crushed ASL signal time series figure

	dlmwrite(strcat(file_name_noncrushed, file_type_txt), noncrushed_asl_signal); % save noncrushed ASL data to a text file
	save_nii(noncrushed_nifty_file_handle, strcat(file_name_noncrushed, file_type_nifty)); % save noncrushed ASL nifty file
	print(noncrushed_asl_figure_handle, '-dpng', file_name_noncrushed, '-r300'); % save noncrushed ASL signal time series figure

	dlmwrite(strcat(file_name_aif, file_type_txt), aif_asl_signal); % save noncrushed ASL data to a text file
	save_nii(aif_nifty_file_handle, strcat(file_name_aif, file_type_nifty)); % save noncrushed ASL nifty file
	print(aif_asl_figure_handle, '-dpng', file_name_aif, '-r300'); % save noncrushed ASL signal time series figure

	print(summary_figure_handle, '-dpng', 'summary_plot', '-r300'); % save ASL signal time series figure

	% go back to working directory
	cd('../');

end
