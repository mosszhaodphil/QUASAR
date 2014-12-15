% This program simulate QUASAR ASL data from a set of user parameters in param_user.m
% The output is a text file which consists of QUASAR ASL data
% File name should be specified by user or by default 'output.txt'

% Program begins

% Load parameters
load('param_basis.mat');
load('param_user.mat');

date_time_format = 'yyyymmdd_HHMMSS'; % date and time format
date_time_now = clock; % get vector of current time
date_time = datestr(date_time_now, date_time_format); % convert current time vector to string

dir_name = strcat('output_', date_time); % Default directory name

file_name_quasar = 'signal_quasar'; % file name to save QUASAR ASL signal
file_name_crushed = 'signal_crushed'; % file name to save crushed ASL signal
file_name_noncrushed = 'signal_noncrushed'; % file name to save noncrushed ASL signal
file_type_txt = '.txt';
file_type_nifty = '.nii.gz';

% Simulate QUASAR ASL signal and save it to file
quasar_asl_signal = zeros(length(t), 1); % construct a vector to store ASL signals at different sampling points specified by variable t
quasar_asl_signal = calculate_ASL_signal(t); % calculate QUASAR ASL signal
quasar_nifty_file_handle = make_nifty_file(quasar_asl_signal); % make nifty file from ASL signal
quasar_asl_figure_handle = plot_quasar_signal(quasar_asl_signal, t);

% Simulate crushed ASL signal and save it to file
crushed_asl_signal = zeros(length(t), 1);
crushed_asl_signal = calculate_delta_M_crush(t);
crushed_nifty_file_handle = make_nifty_file(crushed_asl_signal);
crushed_asl_figure_handle = plot_crushed_signal(crushed_asl_signal, t);

% Simulate noncrushed ASL signal and save it to file
noncrushed_asl_signal = zeros(length(t), 1);
noncrushed_asl_signal = calculate_delta_M_noncrush(t);
noncrushed_nifty_file_handle = make_nifty_file(noncrushed_asl_signal);
noncrushed_asl_figure_handle = plot_noncrushed_signal(noncrushed_asl_signal, t);

% Plot YY curve of three signals
yy_figure_handle = plot_signal_yy([quasar_asl_signal crushed_asl_signal noncrushed_asl_signal], t);

% Save simulated ASL data file in the new directory
mkdir(dir_name);
cd(dir_name);

dlmwrite(strcat(file_name_quasar, file_type_txt), quasar_asl_signal); % save QUASAR ASL data to a text file
save_nii(quasar_nifty_file_handle, strcat(file_name_quasar, file_type_nifty)); % save QUASAR ASL nifty file
print(quasar_asl_figure_handle, '-dpng', file_name_quasar, '-r300'); % save QUASAR ASL signal time series figure

dlmwrite(strcat(file_name_crushed, file_type_txt), crushed_asl_signal); % save crushed ASL data to a text file
save_nii(crushed_nifty_file_handle, strcat(file_name_crushed, file_type_nifty)); % save crushed ASL nifty file
print(crushed_asl_figure_handle, '-dpng', file_name_crushed, '-r300'); % save QUASAR ASL signal time series figure

dlmwrite(strcat(file_name_noncrushed, file_type_txt), noncrushed_asl_signal); % save noncrushed ASL data to a text file
save_nii(noncrushed_nifty_file_handle, strcat(file_name_noncrushed, file_type_nifty)); % save noncrushed ASL nifty file
print(noncrushed_asl_figure_handle, '-dpng', file_name_noncrushed, '-r300'); % save QUASAR ASL signal time series figure

print(yy_figure_handle, '-dpng', 'yyplot', '-r300'); % save QUASAR ASL signal time series figure

% go back to working directory
cd('../');
% quit matlab program (some machines require this step)
% quit;


