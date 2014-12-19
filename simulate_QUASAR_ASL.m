% This program simulate QUASAR ASL data from a set of user parameters in param_user.m
% The output is a saved in the folder output_yyyymmdd_HHMMSS under the same directory

% Program begins

% Load parameters
load('param_basis.mat');
load('param_user.mat');

date_time_format = 'yyyymmdd_HHMMSS'; % date and time format
date_time_now    = clock; % get vector of current time
date_time        = datestr(date_time_now, date_time_format); % convert current time vector to string
dir_name         = strcat('output_', date_time); % Default directory name

file_name_quasar     = 'signal_quasar'; % file name to save QUASAR ASL signal
file_name_blood      = 'signal_blood';
file_name_crushed    = 'signal_crushed'; % file name to save crushed ASL signal
file_name_noncrushed = 'signal_noncrushed'; % file name to save noncrushed ASL signal
file_type_txt        = '.txt';
file_type_nifty      = '.nii.gz';

% Simulate QUASAR (Tissue) ASL signal and save it to file
quasar_asl_signal        = zeros(length(t), 1); % construct a vector to store QUASAR ASL signals at different sampling points specified by variable t
quasar_asl_signal        = calculate_QUASAR_ASL_signal(t); % calculate QUASAR ASL signal
quasar_nifty_file_handle = make_nifty_file(quasar_asl_signal); % make nifty file from QUASAR ASL signal
quasar_asl_figure_handle = plot_quasar_signal(quasar_asl_signal, t); % plot the signal over time

% Simulate Blood ASL signal and save it to file
blood_asl_signal = zeros(length(t), 1);
blood_asl_signal = calculate_delta_M_blood(t);
blood_nifty_file_handle = make_nifty_file(blood_asl_signal); % make nifty file from QUASAR ASL signal
blood_asl_figure_handle = plot_blood_signal(blood_asl_signal, t); % plot the signal over time

% Simulate crushed ASL signal and save it to file
crushed_asl_signal        = zeros(length(t), 1); % construct a vector to store Crushed ASL signals at different sampling points specified by variable t
crushed_asl_signal        = calculate_delta_M_crush(t); % calculate Crushed ASL signal
crushed_nifty_file_handle = make_nifty_file(crushed_asl_signal); % make nifty file from Crushed ASL signal
crushed_asl_figure_handle = plot_crushed_signal(crushed_asl_signal, t); % plot the signal over time

% Simulate noncrushed ASL signal and save it to file
noncrushed_asl_signal        = zeros(length(t), 1); % construct a vector to store Noncrushed ASL signals at different sampling points specified by variable t
noncrushed_asl_signal        = calculate_delta_M_noncrush(t); % calculate Noncrushed ASL signal
noncrushed_nifty_file_handle = make_nifty_file(noncrushed_asl_signal); % make nifty file from Noncrushed ASL signal
noncrushed_asl_figure_handle = plot_noncrushed_signal(noncrushed_asl_signal, t); % plot the signal over time


% Plot summary curve of four signals
summary_figure_handle = subplot_signal([quasar_asl_signal blood_asl_signal crushed_asl_signal noncrushed_asl_signal], t);

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

print(summary_figure_handle, '-dpng', 'summary_plot', '-r300'); % save QUASAR ASL signal time series figure

% go back to working directory
cd('../');
% quit matlab program (some machines require this step)
% quit;


