simulate_QUASAR_ASL;

cd(dir_name);

PATH = getenv('PATH');

% FSLDEVDIR PATH for Mac Book
FSLDEVDIR_BIN = '/Users/mosszhao/Github/FSL_DEV/bin';
% FSLDEVDIR PATH for Linux virtual machine
%FSLDEVDIR_BIN = 'SOMETHING';

% Add FSL command to environment variables
setenv('PATH', [PATH strcat(':', FSLDEVDIR_BIN)]);

% input file
%asl_data_file = 'tc_pv';
data_file_path = 'tc_pv';

% output file
output_file_path = strcat('full_', data_file_path);

% option file
option_file_path = strcat(' ../OPTION_FOLDER/OPTION FILE');


% FABBER COMMAND
fabber_command = strcat('fabber --data=', data_file_path, ' --data-order=singlefile --output=', output_file_path, ' -@', option_file_path);

fabber_command

unix('fabber');

calibration_factor = ' -mul 6000 -div 0.91';

fslmaths_command = strcat('fslmaths ', ' ', output_file_path, ' mean_ftiss', calibration_factor, ' perfusion');

fslmaths_command

unix('fslmaths');


cd('../');

