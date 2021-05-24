function varargout = results(varargin)
% RESULTS MATLAB code for results.fig
%      RESULTS, by itself, creates a new RESULTS or raises the existing
%      singleton*.
%
%      H = RESULTS returns the handle to a new RESULTS or the handle to
%      the existing singleton*.
%
%      RESULTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULTS.M with the given input arguments.
%
%      RESULTS('Property','Value',...) creates a new RESULTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before results_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to results_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help results

% Last Modified by GUIDE v2.5 24-May-2021 00:14:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @results_OpeningFcn, ...
                   'gui_OutputFcn',  @results_OutputFcn, ...
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


% --- Executes just before results is made visible.
function results_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to results (see VARARGIN)

% Choose default command line output for results
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes results wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global solution;
headers = [num2cell('t')];
for i = 1:size(solution, 2)-1
    str = ['<html>x<sub>' num2str(i) '</sub></html>'];
    headers = [headers num2cell(str, 2)];
end
set(handles.table_res, 'ColumnName', headers);
set(handles.table_res, 'Data', solution);


% --- Outputs from this function are returned to the command line.
function varargout = results_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in popupmenu_g2_1.
function popupmenu_g2_1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_g2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_g2_1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_g2_1
global solution;
axes(handles.axes3);
x1 = get(hObject, 'Value');
x2 = get(handles.popupmenu_g2_2, 'Value');
cla(handles.axes3);
plot(solution(:, x1), solution(:, x2+1));

% --- Executes during object creation, after setting all properties.
function popupmenu_g2_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_g2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global solution;
headers = ['t'];
for i = 1:size(solution, 2)-1
   str = ['<html>x<sub>' num2str(i) '</sub></html>'];
   headers = [headers num2cell(str, 2)];
end
set(hObject, 'String', headers);


% --- Executes on selection change in popupmenu_g2_2.
function popupmenu_g2_2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_g2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_g2_2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_g2_2
global solution;
axes(handles.axes3);
x1 = get(handles.popupmenu_g2_1, 'Value');
x2 = get(hObject, 'Value');
cla(handles.axes3);
plot(solution(:, x1), solution(:, x2+1));

% --- Executes during object creation, after setting all properties.
function popupmenu_g2_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_g2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global solution;
headers = zeros(0);
for i = 1:size(solution, 2)-1
   str = ['<html>x<sub>' num2str(i) '</sub></html>'];
   headers = [headers num2cell(str, 2)];
end
set(hObject, 'String', headers);


function table_res_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function table_show_res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to table_show_res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global solution;
data = {'Все', 'Любой', '-', false};
for i = 1:size(solution, 2)-1
    str = ['<html>x<sub>' num2str(i) '</sub></html>'];
    data = [data; {str, 'Любой', '-', false}];
end
set(hObject, 'Data', data);

% --- Executes when entered data in editable cell(s) in table_show_res.
function table_show_res_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_show_res (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global solution;
tmpX = zeros(0);
tableData = get(hObject, 'Data');
data = zeros(0);
axes(handles.axes_x);
condition1 = (eventdata.Indices(1) == 1) && (eventdata.Indices(2) == 2);
condition2 = (eventdata.Indices(1) == 1) && (eventdata.Indices(2) == 3);
condition3 = (eventdata.Indices(1) == 1) && (eventdata.Indices(2) == 4);
if condition1 || condition2 || condition3
    answ = cell2mat(tableData(1, 4));
    if answ
        data = {'Все', char(tableData(1, 2)), char(tableData(1, 3)), true};
        for i = 1:size(solution, 2)-1
            str = ['<html>x<sub>' num2str(i) '</sub></html>'];
            data = [data; {str, char(tableData(i+1, 2)), char(tableData(i+1, 3)), true}];
        end
        set(hObject, 'Data', data);

        hold on;
        cla(handles.axes_x);
        if strcmp(char(data(1, 2)), 'Любой')
            for i = 2:size(solution, 2)
            	plot(solution(:, 1), solution(:, i), char(data(1, 3)));
            end
        else
        	lineStyle = char(data(1, 3));
        	lineColor = char(data(1, 2));
        	for i = 2:size(solution, 2)
            	plot(solution(:, 1), solution(:, i), 'Color', lineColor, 'LineStyle', lineStyle);
            end
        end
    else 
        data = {'Все', char(tableData(1, 2)), char(tableData(1, 3)), false};
    	for i = 1:size(solution, 2)-1
          	str = ['<html>x<sub>' num2str(i) '</sub></html>'];
         	data = [data; {str, char(tableData(i+1, 2)), char(tableData(i+1, 3)), false}];
        end
      	set(hObject, 'Data', data);
      	cla(handles.axes_x);
 	end
else
  	tableData(1, :) = {'Все', char(tableData(1, 2)), char(tableData(1, 3)), true};
  	hold on;
  	cla(handles.axes_x);
  	for i = 2:size(solution, 2)
      	answ = cell2mat(tableData(i, 4));
      	if answ 
          	if strcmp(char(tableData(i, 2)), 'Любой')
             	plot(solution(:, 1), solution(:, i), char(tableData(i, 3)));
            else
               	lineStyle = char(tableData(i, 3));
             	lineColor = char(tableData(i, 2));
              	plot(solution(:, 1), solution(:, i), 'LineStyle', lineStyle, 'Color', lineColor);
            end
                    
        else
            tableData(1, :) = {'Все', char(tableData(1, 2)), char(tableData(1, 3)), false};
        end
  	end
    set(hObject, 'Data', tableData);
end
