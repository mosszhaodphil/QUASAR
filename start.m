function varargout = start(varargin)
% START MATLAB code for start.fig
%      START, by itself, creates a new START or raises the existing
%      singleton*.
%
%      H = START returns the handle to a new START or the handle to
%      the existing singleton*.
%
%      START('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in START.M with the given input arguments.
%
%      START('Property','Value',...) creates a new START or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before start_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to start_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help start

% Last Modified by GUIDE v2.5 27-Dec-2014 15:20:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @start_OpeningFcn, ...
                   'gui_OutputFcn',  @start_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before start is made visible.
function start_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to start (see VARARGIN)

% Load default parameters
set_param_default(handles);

% Choose default command line output for start
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes start wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = start_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pb_plot.
function pb_plot_Callback(hObject, eventdata, handles)
% hObject    handle to pb_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

param_handles = handles;

% Check parameters (to be implemented)
% Now we assumes everything is correct
%check_gui_params(param_handles);

% Set parameters
% Set parameters
set_param_basis();
set_param_user(handles);

% Load parameters
load('param_basis.mat');
load('param_user.mat', 't');

% Simulate signals

% Simulate QUASAR (Tissue) signal
quasar_asl_signal = zeros(length(t), 1); % construct a vector to store QUASAR ASL signals at different sampling points specified by variable t
quasar_asl_signal = calculate_QUASAR_ASL_signal(t); % calculate QUASAR ASL signal

% Simulate Blood ASL signal
blood_asl_signal = zeros(length(t), 1); % construct a vector to store Blood ASL signals at different sampling points specified by variable t
blood_asl_signal = calculate_delta_M_blood(t); % calculate Blood ASL signal

% Simulate crushed ASL signal and save it to file
crushed_asl_signal = zeros(length(t), 1); % construct a vector to store Crushed ASL signals at different sampling points specified by variable t
crushed_asl_signal = calculate_delta_M_crush(t); % calculate Crushed ASL signal

% Simulate noncrushed ASL signal and save it to file
noncrushed_asl_signal = zeros(length(t), 1); % construct a vector to store Noncrushed ASL signals at different sampling points specified by variable t
noncrushed_asl_signal = calculate_delta_M_noncrush(t); % calculate Noncrushed ASL signal

% Plot four curves

% Plot QUASAR (Tissue) signal curve on upper left
plot_quasar_signal(quasar_asl_signal, t, handles);
hold on;

% Plot Blood signal curve on upper right
plot_blood_signal(blood_asl_signal, t, handles);
hold on;

% Plot Crushed signal curve on lower left
plot_crushed_signal(crushed_asl_signal, t, handles);
hold on;

% Plot Noncrushed signal curve on lower right
plot_noncrushed_signal(noncrushed_asl_signal, t, handles);

% --- Executes on button press in pb_save.
function pb_save_Callback(hObject, eventdata, handles)
% hObject    handle to pb_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pb_reset.
function pb_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pb_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Reset GUI to initial state
% Remove all plots
% Assign default to parameters
reset_gui(handles);


function et_cbf_Callback(hObject, eventdata, handles)
% hObject    handle to et_cbf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_cbf as text
%        str2double(get(hObject,'String')) returns contents of et_cbf as a double


% --- Executes during object creation, after setting all properties.
function et_cbf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_cbf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_abv_Callback(hObject, eventdata, handles)
% hObject    handle to et_abv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_abv as text
%        str2double(get(hObject,'String')) returns contents of et_abv as a double


% --- Executes during object creation, after setting all properties.
function et_abv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_abv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_t1_a_Callback(hObject, eventdata, handles)
% hObject    handle to et_t1_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_t1_a as text
%        str2double(get(hObject,'String')) returns contents of et_t1_a as a double


% --- Executes during object creation, after setting all properties.
function et_t1_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_t1_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_t1_t_Callback(hObject, eventdata, handles)
% hObject    handle to et_t1_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_t1_t as text
%        str2double(get(hObject,'String')) returns contents of et_t1_t as a double


% --- Executes during object creation, after setting all properties.
function et_t1_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_t1_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_tau_m_Callback(hObject, eventdata, handles)
% hObject    handle to et_tau_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_tau_m as text
%        str2double(get(hObject,'String')) returns contents of et_tau_m as a double


% --- Executes during object creation, after setting all properties.
function et_tau_m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_tau_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_tau_t_Callback(hObject, eventdata, handles)
% hObject    handle to et_tau_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_tau_t as text
%        str2double(get(hObject,'String')) returns contents of et_tau_t as a double


% --- Executes during object creation, after setting all properties.
function et_tau_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_tau_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_ti_Callback(hObject, eventdata, handles)
% hObject    handle to et_ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_ti as text
%        str2double(get(hObject,'String')) returns contents of et_ti as a double


% --- Executes during object creation, after setting all properties.
function et_ti_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end