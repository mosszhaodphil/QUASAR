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

signal_file_name = 'quasar_signal.txt'; % Default file name
nifty_file_name = 'signal.nii.gz';
dir_name = strcat('output_', date_time); % Default directory name

% construct a vector to store ASL signals at different sampling points specified by variable t
quasar_asl_signal = zeros(length(t), 1);

% calculate QUASAR ASL signal
quasar_asl_signal = calculate_ASL_signal(t);

% make nifty file from ASL signal
nifty_file_handle = make_nifty_file(quasar_asl_signal);

% Save simulated ASL data file in the new directory
mkdir(dir_name);
cd(dir_name);
dlmwrite(signal_file_name, quasar_asl_signal); % save ASL data to a text file
save_nii(nifty_file_handle, nifty_file_name);% save nifty file


% quit matlab program (some machines require this step)
% quit;