function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 24-May-2021 09:20:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

filename = ['Examples/default' '.mat'];
load_workspace_from_file(handles, filename);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% MY

% --------------------------------------------------------------------
function examples_menu_Callback(hObject, eventdata, handles)
% hObject    handle to examples_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mainHandles;
mainHandles = handles;
run('examples.m');


function about_menu_Callback(hObject, eventdata, handles)
% hObject    handle to about_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('about.m');


function help_menu_Callback(hObject, eventdata, handles)
% hObject    handle to help_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('help.m');


function edit_start_Callback(hObject, eventdata, handles)
% hObject    handle to edit_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_start as text
%        str2double(get(hObject,'String')) returns contents of edit_start as a double
global edit_start;
try
    edit_start = get(hObject, 'String');
    edit_start = sym(edit_start);
    edit_start = double(edit_start);
    if isnan(edit_start)
        set(hObject, 'ForegroundColor', 'red');
        set(hObject, 'String', 'Error');
        edit_start = 0;
    end
    uicontrol(handles.edit_end);
    set(hObject, 'ForegroundColor', [0.07 0.21 0.14]);
catch
    set(hObject, 'ForegroundColor', 'red');
    set(hObject, 'String', 'Error');
    edit_start = 0;
end

% --- Executes during object creation, after setting all properties.
function edit_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_end_Callback(hObject, eventdata, handles)
% hObject    handle to edit_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_end as text
%        str2double(get(hObject,'String')) returns contents of edit_end as a double
global edit_end;
try
    edit_end = get(hObject, 'String');
    edit_end = sym(edit_end);
    edit_end = double(edit_end);
    if isnan(edit_end)
        set(hObject, 'ForegroundColor', 'red');
        set(hObject, 'String', 'Error');
        edit_end = 0;
    end
    uicontrol(handles.edit_iter_count);
    set(hObject, 'ForegroundColor', [0.07 0.21 0.14]);
catch
    set(hObject, 'ForegroundColor', 'red');
    set(hObject, 'String', 'Error');
    edit_end = 0;
end

% --- Executes during object creation, after setting all properties.
function edit_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_iter_count_Callback(hObject, eventdata, handles)
% hObject    handle to edit_iter_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_iter_count as text
%        str2double(get(hObject,'String')) returns contents of edit_iter_count as a double
global edit_iter_count;
try
    edit_iter_count = get(hObject, 'String');
    edit_iter_count = sym(edit_iter_count);
    edit_iter_count = double(edit_iter_count);
    if isnan(edit_iter_count)
        set(hObject, 'ForegroundColor', 'red');
        set(hObject, 'String', 'Error');
        edit_iter_count = 0;
    end
    uicontrol(handles.edit_step);
    set(hObject, 'ForegroundColor', [0.07 0.21 0.14]);
catch
    set(hObject, 'ForegroundColor', 'red');
    set(hObject, 'String', 'Error');
    edit_iter_count = 0;
end

% --- Executes during object creation, after setting all properties.
function edit_iter_count_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_iter_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_prec_out_Callback(hObject, eventdata, handles)
% hObject    handle to edit_prec_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_prec_out as text
%        str2double(get(hObject,'String')) returns contents of edit_prec_out as a double
global edit_prec_out;
try
    edit_prec_out = get(hObject, 'String');
    edit_prec_out = sym(edit_prec_out);
    edit_prec_out = double(edit_prec_out);
    if isnan(edit_prec_out)
        set(hObject, 'ForegroundColor', 'red');
        set(hObject, 'String', 'Error');
        edit_prec_out = 0;
    end
    uicontrol(handles.edit_prec_in);
    set(hObject, 'ForegroundColor', [0.07 0.21 0.14]);
catch
    set(hObject, 'ForegroundColor', 'red');
    set(hObject, 'String', 'Error');
    edit_prec_out = 0;
end

% --- Executes during object creation, after setting all properties.
function edit_prec_out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_prec_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_prec_in_Callback(hObject, eventdata, handles)
% hObject    handle to edit_prec_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_prec_in as text
%        str2double(get(hObject,'String')) returns contents of edit_prec_in as a double
global edit_prec_in;
try
    edit_prec_in = get(hObject, 'String');
    edit_prec_in = sym(edit_prec_in);
    edit_prec_in = double(edit_prec_in);
    if isnan(edit_prec_in)
        set(hObject, 'ForegroundColor', 'red');
        set(hObject, 'String', 'Error');
        edit_prec_in = 0;
    end
    uicontrol(handles.popupmenu_out);
    set(hObject, 'ForegroundColor', [0.07 0.21 0.14]);
catch
    set(hObject, 'ForegroundColor', 'red');
    set(hObject, 'String', 'Error');
    edit_prec_in = 0;
end

% --- Executes during object creation, after setting all properties.
function edit_prec_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_prec_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_step_Callback(hObject, eventdata, handles)
% hObject    handle to edit_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_step as text
%        str2double(get(hObject,'String')) returns contents of edit_step as a double
global edit_step;
try
    edit_step = get(hObject, 'String');
    edit_step = sym(edit_step);
    edit_step = double(edit_step);
    if isnan(edit_step)
        set(hObject, 'ForegroundColor', 'red');
        set(hObject, 'String', 'Error');
        edit_step = 0;
    end
    uicontrol(handles.edit_t);
    set(hObject, 'ForegroundColor', [0.07 0.21 0.14]);
catch
    set(hObject, 'ForegroundColor', 'red');
    set(hObject, 'String', 'Error');
    edit_step = 0;
end

% --- Executes during object creation, after setting all properties.
function edit_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_t_Callback(hObject, eventdata, handles)
% hObject    handle to edit_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_t as text
%        str2double(get(hObject,'String')) returns contents of edit_t as a double
global edit_t;
try
    edit_t = get(hObject, 'String');
    edit_t = sym(edit_t);
    edit_t = double(edit_t);
    if isnan(edit_t)
        set(hObject, 'ForegroundColor', 'red');
        set(hObject, 'String', 'Error');
        edit_t = 0;
    end
    uicontrol(handles.edit_prec_out);
    set(hObject, 'ForegroundColor', [0.07 0.21 0.14]);
catch
    set(hObject, 'ForegroundColor', 'red');
    set(hObject, 'String', 'Error');
    edit_t = 0;
end

% --- Executes during object creation, after setting all properties.
function edit_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_out.
function popupmenu_out_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_out contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_out
global popupmenu_out popupmenu_out_name;
popupmenu_out = get(hObject, 'Value');
popupmenu_out_name = get(hObject, 'String');
popupmenu_out_name = popupmenu_out_name(popupmenu_out);
uicontrol(handles.popupmenu_in);

% --- Executes during object creation, after setting all properties.
function popupmenu_out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_in.
function popupmenu_in_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_in contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_in
global popupmenu_in popupmenu_in_name;
popupmenu_in = get(hObject, 'Value');
popupmenu_in_name = get(hObject, 'String');
popupmenu_in_name = popupmenu_in_name(popupmenu_in);

% --- Executes during object creation, after setting all properties.
function popupmenu_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_res.
function pushbutton_res_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('results.m');


% --- Executes on button press in pushbutton_sol.
function pushbutton_sol_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global solution;
global edit_start edit_end edit_iter_count edit_step edit_t;
global edit_prec_in edit_prec_out;
global popupmenu_in popupmenu_out;
global table_task table_cond table_start_p;
try
    tic
    h = waitbar(0, 'Пожалуйста, подождите, задача решается...');
    solution = solve(edit_start, edit_end, edit_iter_count, edit_step, edit_t, edit_prec_in, edit_prec_out, popupmenu_in, popupmenu_out,table_task,table_cond,table_start_p, h);
    sol_time = toc;
    set(handles.edit12, 'String', sol_time);
    set(handles.pushbutton_res, 'Enable', 'on');
    close(h);
    run('results.m');
catch
    try
        close(h);
    catch
    end
    errorMessage = errordlg('Перезапустите еще раз');
end

% --- Executes on button press in pushbutton_clear.
function pushbutton_clear_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = ['Examples/default' '.mat'];
load_workspace_from_file(handles, filename);


% --- Executes during object creation, after setting all properties.
function table_cond_CreateFcn(hObject, eventdata, handles)
% hObject    handle to table_cond (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function load_task_Callback(hObject, eventdata, handles)
% hObject    handle to load_task (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.mat', 'Открыть файл');
if pathname == 0 
 	return
end
load_workspace_from_file(handles, fullfile(pathname, filename));

% --------------------------------------------------------------------
function save_task_Callback(hObject, eventdata, handles)
% hObject    handle to save_task (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i = 1;
while true
 	fn = ['New task' num2str(i) '.mat'];
  	if exist(fn, 'file') 
        i = i + 1;
    else 
        [filename, pathname] = uiputfile(fn, 'Сохранить как...');
        if pathname == 0 
            i = i - 1;
            return
        end 
        break;
    end
end
saveDataName = fullfile(pathname, filename); 

global solution;
global edit_start edit_end edit_iter_count edit_step edit_t;
global edit_prec_in edit_prec_out;
global popupmenu_in popupmenu_out;
global table_task table_cond table_start_p;
global edit_task_name edit_task_comment;
buttons = {get(handles.pushbutton_sol, 'Enable'); get(handles.pushbutton_clear, 'Enable'); get(handles.pushbutton_res, 'Enable')};
save(saveDataName, 'solution', 'edit_iter_count', 'table_task', 'table_cond', 'edit_start', 'edit_end', 'edit_step', 'edit_prec_out', 'edit_prec_in', 'popupmenu_out', 'popupmenu_in','edit_t', 'table_start_p', 'buttons', 'edit_task_name', 'edit_task_comment');



function edit_task_name_Callback(hObject, eventdata, handles)
% hObject    handle to edit_task_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_task_name as text
%        str2double(get(hObject,'String')) returns contents of edit_task_name as a double
global edit_task_name;
edit_task_name = get(hObject, 'String');

% --- Executes during object creation, after setting all properties.
function edit_task_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_task_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_task_comment_Callback(hObject, eventdata, handles)
% hObject    handle to edit_task_comment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_task_comment as text
%        str2double(get(hObject,'String')) returns contents of edit_task_comment as a double
global edit_task_comment;
edit_task_comment = get(hObject, 'String');

% --- Executes during object creation, after setting all properties.
function edit_task_comment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_task_comment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in table_task.
function table_task_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_task (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
%try
  	global table_task;
  	currentData = get(hObject, 'Data');
  	countOfRows = size(currentData, 1);
    newData = zeros(0, 0);
    
    for i = 1:countOfRows
      	if i ~= countOfRows
         	if strcmp(currentData(i, 2), '')
              	for k = i+1:countOfRows
                   	newRowName = ['<html>x''<sub>' num2str(k - 1) '</sub></html>'];
                  	newRow = {newRowName, strjoin(currentData(k, 2))};
                  	newData = [newData; newRow];
                end
              	currentData = newData;
             	countOfRows = size(currentData, 1);
             	set(hObject, 'Data', currentData);
             	table_task = currentData;
              	break;
            else
               	newRowName = ['<html>x''<sub>' num2str(i) '</sub></html>'];
              	newRow = {newRowName, strjoin(currentData(i, 2))};
             	newData = [newData; newRow];
            end
        else
          	newRowName = ['<html>x''<sub>' num2str(i) '</sub></html>'];
          	newRow = {newRowName, strjoin(currentData(i, 2))};
          	newData = [newData; newRow];
          	currentData = newData;
         	countOfRows = size(currentData, 1);
                
         	if strcmp(currentData(i, 2), '')
                set(hObject, 'Data', currentData);
              	table_task = currentData;
            else
              	newRowName = ['<html>x''<sub>' num2str((countOfRows + 1)) '</sub></html>'];
             	newRow = {newRowName, ''};
              	newData = [currentData; newRow];
              	set(hObject, 'Data', newData);
             	table_task = newData;
            end
        end
    end
        
  	currentData = get(hObject, 'Data');
    condData = get(handles.table_cond, 'Data');
    initData = get(handles.table_start_p, 'Data');
        
    if strcmp(currentData(end, 2), '') 
        if (size(currentData, 1) - 1) > size(condData, 1)
            condData = [condData; {''}];
            initData = [initData {''}];
        end
        if (size(currentData, 1) - 1) < size(condData, 1)
            condData = condData(1:end-1, :);
            initData = initData(:, 1:end-1);
        end
    else
        if size(currentData, 1) > size(condData, 1)
            condData = [condData; {''}];
            initData = [initData {''}];
        end
        if size(currentData, 1) < size(condData, 1)
            condData = condData(1:end-1, :);
            initData = initData(:, 1:end-1);
        end
    end
    set(handles.table_cond, 'Data', condData);
    set(handles.table_start_p, 'Data', initData);
    
      
	
        
    
%catch
%    errorMessage = errordlg('Неправильно заполнены данные в таблице');
%end



% --- Executes when entered data in editable cell(s) in table_cond.
function table_cond_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_cond (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global table_cond;
table_cond = get(hObject, 'Data');


% --- Executes when entered data in editable cell(s) in table_start_p.
function table_start_p_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_start_p (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global table_start_p;
table_start_p = get(hObject, 'Data');
table_start_p = sym(table_start_p);
table_start_p = double(table_start_p);



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
