% This code is the implementation the following papers
% MA Chappell (2012) doi: 10.1002/mrm.24372 (MACQ)
% MA Chappell (2012) doi: 10.1002/mrm.24260 (MACD)
% ET Petersen (2006) doi: 10.1002/mrm.20784 (ETP)

function [] = set_param_user(varargin)

	% Default variables
	% User input variables
	f                     = 32 / 6000; % CBF need to convert from ml/100ml/min to ml/g/s
	arterial_blood_volume = 0.81 / 100; % arterial blood volume in percentage
	tau_t                 = 1; % Bolus arrival time to tissue
	tau_m                 = 1.2; % Bolus arrival time to microvasculature
	t1_t                  = 1.3; % T1 relaxation of tissue
	t1_a                  = 1.65; % T1 relaxation of arterial blood, in postprocessing section of (ETP)
	t                     = 0 : 0.2 : 10; % sampling time pints, second variable must be equal to delta_ti
	m_0a                  = 1; % equilibrium magnetization of arterial blood
	inversion_efficiency  = 0.91; % inversion efficiency alpha, in postprocessing section of (ETP)
	crush_efficiency      = 0.35; % percentage of arterial blood signal removed

	dispersion_type       = 1; % no dispersion

	if(length(varargin) == 1)
		current_handles = varargin{1};
		f = str2double(get(current_handles.et_cbf, 'String')) / 6000;
		arterial_blood_volume = str2double(get(current_handles.et_abv, 'String')) / 100;
		tau_t = str2double(get(current_handles.et_tau_t, 'String'));
		tau_m = str2double(get(current_handles.et_tau_m, 'String'));
		t1_t = str2double(get(current_handles.et_t1_t, 'String'));
		t1_a = str2double(get(current_handles.et_t1_a, 'String'));
		t = eval(get(current_handles.et_ti, 'String'));

	end


	% save the these variables in a file
	filename = 'param_user.mat';
	save(filename, 'f', 'arterial_blood_volume', 'tau_t', 'tau_m', 't1_t', 't1_a', 't', 'm_0a', 'inversion_efficiency', 'dispersion_type', 'crush_efficiency');

end

