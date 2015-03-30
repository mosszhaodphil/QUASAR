% This program simulate tissue ASL data from a set of user parameters in param_user.m
% The output is a saved in the folder output_yyyymmdd_HHMMSS under the same directory

close all;
%clear all;

clear variables;

% Program begins

% Set parameters
set_param_basis();
set_param_user();

% Load parameters
load('param_basis.mat');
load('param_user.mat');

date_time_format = 'yyyymmdd_HHMMSS'; % date and time format
date_time_now    = clock; % get vector of current time
date_time        = datestr(date_time_now, date_time_format); % convert current time vector to string
dir_name         = strcat('output_', date_time); % Default directory name

file_name_mask       = 'mask_quasar'; % file name to save mask
file_name_tissue     = 'signal_tissue'; % file name to save Tissue ASL signal
file_name_blood      = 'signal_blood'; % file name to save Blood ASL signal
file_name_crushed    = 'signal_crushed'; % file name to save crushed ASL signal
file_name_noncrushed = 'signal_noncrushed'; % file name to save noncrushed ASL signal
file_name_aif        = 'signal_aif'; % file name to save arterial input function (AIF) signal
file_name_tc         = 'signal_tc'; % file name to save raw ASl (Tag minus control tc) signal
file_name_tc_noise   = 'signal_tc_noise';
file_type_txt        = '.txt'; % text file extension
file_type_nifty      = '.nii.gz'; % nifty file extension

position = [32 32 1]; % position on 4D matrix to assgin time series signal

% Make mask file
mask_matrix            = make_mask_matrix(param_mr_str.m, param_mr_str.m, param_mr_str.n_slices); % construct mask matrix
mask_nifty_file_handle = make_nifty_file(mask_matrix);

% Simulate Tisue ASL signal and save it to file
tissue_asl_signal        = zeros(length(param_user_str.t), 1); % construct a vector to store Tissue ASL signals at different sampling points specified by variable t
tissue_asl_signal        = calculate_delta_M_tissue(param_user_str.t); % calculate Tissue ASL signal
tissue_asl_matrix		 = make_4D_matrix(tissue_asl_signal, position); % make 4D matrix to save Tissue ASL signal
tissue_nifty_file_handle = make_nifty_file(tissue_asl_matrix); % make nifty file from Tissue ASL signal
tissue_asl_figure_handle = plot_tissue_signal(tissue_asl_signal, param_user_str.t); % plot the signal over time

% Simulate Blood ASL signal and save it to file
blood_asl_signal        = zeros(length(param_user_str.t), 1); % construct a vector to store Blood ASL signals at different sampling points specified by variable t
blood_asl_signal        = calculate_delta_M_blood(param_user_str.t); % calculate Blood ASL signal
blood_asl_matrix		= make_4D_matrix(blood_asl_signal, position); % make 4D matrix to save Blood ASL signal
blood_nifty_file_handle = make_nifty_file(blood_asl_matrix); % make nifty file from Blood ASL signal
blood_asl_figure_handle = plot_blood_signal(blood_asl_signal, param_user_str.t); % plot the signal over time

% Simulate crushed ASL signal and save it to file
crushed_asl_signal        = zeros(length(param_user_str.t), 1); % construct a vector to store Crushed ASL signals at different sampling points specified by variable t
crushed_asl_signal        = calculate_delta_M_crush(param_user_str.t); % calculate Crushed ASL signal
crushed_asl_matrix		  = make_4D_matrix(crushed_asl_signal, position); % make 4D matrix to save Crushed ASL signal
crushed_nifty_file_handle = make_nifty_file(crushed_asl_matrix); % make nifty file from Crushed ASL signal
crushed_asl_figure_handle = plot_crushed_signal(crushed_asl_signal, param_user_str.t); % plot the signal over time

% Simulate noncrushed ASL signal and save it to file
noncrushed_asl_signal        = zeros(length(param_user_str.t), 1); % construct a vector to store Noncrushed ASL signals at different sampling points specified by variable t
noncrushed_asl_signal        = calculate_delta_M_noncrush(param_user_str.t); % calculate Noncrushed ASL signal
noncrushed_asl_matrix		 = make_4D_matrix(noncrushed_asl_signal, position); % make 4D matrix to save Noncrushed ASL signal
noncrushed_nifty_file_handle = make_nifty_file(noncrushed_asl_matrix); % make nifty file from Noncrushed ASL signal
noncrushed_asl_figure_handle = plot_noncrushed_signal(noncrushed_asl_signal, param_user_str.t); % plot the signal over time

% Simulate AIF ASL signal and save it to file
aif_asl_signal        = zeros(length(param_user_str.t), 1); % construct a vector to store AIF signals at different sampling points specified by variable t
aif_asl_signal        = calculate_delivery_tissue_Buxton(param_user_str.t); % calculate AIF signal
aif_asl_matrix		  = make_4D_matrix(aif_asl_signal, position); % make 4D matrix to save AIF ASL signal
aif_nifty_file_handle = make_nifty_file(aif_asl_matrix); % make nifty file from AIF signal
aif_asl_figure_handle = plot_aif_signal(aif_asl_signal, param_user_str.t); % plot the signal over time

% Make a raw ASL matrix from crushed and noncrushed signals
% This is equivelant to Label(Tag) minus Control (tc) of raw ASL signal
tc_asl_matrix        = make_raw_QUASAR_matrix(tissue_asl_matrix, blood_asl_matrix);
tc_nifty_file_handle = make_nifty_file(tc_asl_matrix);  % Save raw ASL matrix in nifty file

% Add noise
tissue_asl_noise_signal = add_white_noise(tissue_asl_signal, param_user_str.snr);
tissue_asl_noise_matrix = make_4D_matrix(tissue_asl_noise_signal, position);
blood_asl_noise_signal  = add_white_noise(blood_asl_signal, param_user_str.snr);
blood_asl_noise_matrix  = make_4D_matrix(blood_asl_noise_signal, position);
tc_asl_noise_matrix        = make_raw_QUASAR_matrix(tissue_asl_noise_matrix, blood_asl_noise_matrix);
tc_noise_nifty_file_handle = make_nifty_file(tc_asl_noise_matrix);  % Save raw ASL matrix in nifty file

% Plot summary curve (4x4) of four signals
summary_figure_handle = subplot_signal([tissue_asl_signal blood_asl_signal crushed_asl_signal noncrushed_asl_signal], param_user_str.t);

% save parameters of current simulation
save_parameters();

% Save simulated ASL data file in the new directory
mkdir(dir_name);
cd(dir_name);

save_nii(mask_nifty_file_handle, strcat(file_name_mask, file_type_nifty)); % save mask nifty file

dlmwrite(strcat(file_name_tissue, file_type_txt), tissue_asl_signal); % save tissue ASL data to a text file
save_nii(tissue_nifty_file_handle, strcat(file_name_tissue, file_type_nifty)); % save tissue ASL nifty file
print(tissue_asl_figure_handle, '-dpng', file_name_tissue, '-r300'); % save tissue ASL signal time series figure

dlmwrite(strcat(file_name_blood, file_type_txt), blood_asl_signal); % save blood ASL data to a text file
save_nii(blood_nifty_file_handle, strcat(file_name_blood, file_type_nifty)); % save blood ASL nifty file
print(blood_asl_figure_handle, '-dpng', file_name_blood, '-r300'); % save blood ASL signal time series figure

dlmwrite(strcat(file_name_crushed, file_type_txt), crushed_asl_signal); % save crushed ASL data to a text file
save_nii(crushed_nifty_file_handle, strcat(file_name_crushed, file_type_nifty)); % save crushed ASL nifty file
print(crushed_asl_figure_handle, '-dpng', file_name_crushed, '-r300'); % save crushed ASL signal time series figure

dlmwrite(strcat(file_name_noncrushed, file_type_txt), noncrushed_asl_signal); % save noncrushed ASL data to a text file
save_nii(noncrushed_nifty_file_handle, strcat(file_name_noncrushed, file_type_nifty)); % save noncrushed ASL nifty file
print(noncrushed_asl_figure_handle, '-dpng', file_name_noncrushed, '-r300'); % save noncrushed ASL signal time series figure

dlmwrite(strcat(file_name_aif, file_type_txt), noncrushed_asl_signal); % save noncrushed ASL data to a text file
save_nii(aif_nifty_file_handle, strcat(file_name_aif, file_type_nifty)); % save noncrushed ASL nifty file
print(aif_asl_figure_handle, '-dpng', file_name_aif, '-r300'); % save noncrushed ASL signal time series figure

% Save raw ASL tc file
save_nii(tc_nifty_file_handle, strcat(file_name_tc, file_type_nifty));

save_nii(tc_noise_nifty_file_handle, strcat(file_name_tc_noise, file_type_nifty))

print(summary_figure_handle, '-dpng', 'summary_plot', '-r300'); % save ASL signal time series figure

% Copy the default files to result directory
%copyfile('../mask.nii.gz', '.'); % Copy mask file
copyfile('../g.nii.gz', '.'); % Copy g file for flip angle correction
copyfile('../T1t.nii.gz', '.'); % Copy T1 tissue file
copyfile('../options.txt', '.'); % Copy parameters options file for model based analysis

% Move parameter file to result directory
movefile('../parameters.txt', '.');

% go back to working directory
cd('../');

% delete the binary files
delete('param_basis.mat');
delete('param_user.mat');

% quit matlab program (some machines require this step)
% quit;


