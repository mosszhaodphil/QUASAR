% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

function [] = set_param_user(varargin)

	% Default variables
	% User input variables
	param_user_str                       = struct;
	param_user_str.f                     = 80 / 6000; % CBF need to convert from ml/100ml/min to ml/g/s
	param_user_str.arterial_blood_volume = 1.5 / 100; % arterial blood volume in percentage
	param_user_str.tau_t                 = 1.2; % Bolus arrival time to tissue (microvasculature)
	param_user_str.tau_m                 = 1; % Bolus arrival time to vasculature
	param_user_str.t1_t                  = 1.3; % T1 relaxation of tissue
	param_user_str.t1_a                  = 1.6; % T1 relaxation of arterial blood, in postprocessing section of (ETP)
	param_user_str.t                     = 0.04 : 0.30 : 3.64; % sampling time pints, second variable must be equal to delta_ti
	param_user_str.m_0a                  = 1; % equilibrium magnetization of arterial blood
	param_user_str.inversion_efficiency  = 0.91; % inversion efficiency alpha, in postprocessing section of (ETP)
	param_user_str.crush_efficiency      = 0; % percentage of arterial blood signal remaining after applying crusher gradients

	param_user_str.dispersion_type       = 1; % no dispersion

	if(length(varargin) == 1)
		current_handles                      = varargin{1};
		param_user_str.f                     = str2double(get(current_handles.et_cbf, 'String')) / 6000;
		param_user_str.arterial_blood_volume = str2double(get(current_handles.et_abv, 'String')) / 100;
		param_user_str.tau_t                 = str2double(get(current_handles.et_tau_t, 'String'));
		param_user_str.tau_m                 = str2double(get(current_handles.et_tau_m, 'String'));
		param_user_str.t1_t                  = str2double(get(current_handles.et_t1_t, 'String'));
		param_user_str.t1_a                  = str2double(get(current_handles.et_t1_a, 'String'));
		param_user_str.t                     = eval(get(current_handles.et_ti, 'String'));

	end


	% save the user parameters in a file
	filename = 'param_user.mat';
	save(filename, 'param_user_str');

end

