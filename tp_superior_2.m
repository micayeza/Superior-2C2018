function varargout = tp_superior_2(varargin)
% TP_SUPERIOR_2 MATLAB code for tp_superior_2.fig
%      TP_SUPERIOR_2, by itself, creates a new TP_SUPERIOR_2 or raises the existing
%      singleton*.
%
%      H = TP_SUPERIOR_2 returns the handle to a new TP_SUPERIOR_2 or the handle to
%      the existing singleton*.
%
%      TP_SUPERIOR_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP_SUPERIOR_2.M with the given input arguments.
%
%      TP_SUPERIOR_2('Property','Value',...) creates a new TP_SUPERIOR_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tp_superior_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tp_superior_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tp_superior_2

% Last Modified by GUIDE v2.5 08-Nov-2018 17:08:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tp_superior_2_OpeningFcn, ...
                   'gui_OutputFcn',  @tp_superior_2_OutputFcn, ...
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


% --- Executes just before tp_superior_2 is made visible.
function tp_superior_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tp_superior_2 (see VARARGIN)

% Choose default command line output for tp_superior_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tp_superior_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tp_superior_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function x0_Callback(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0 as text
%        str2double(get(hObject,'String')) returns contents of x0 as a double


% --- Executes during object creation, after setting all properties.
function x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function decimales_Callback(hObject, eventdata, handles)
% hObject    handle to decimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of decimales as text
%        str2double(get(hObject,'String')) returns contents of decimales as a double


% --- Executes during object creation, after setting all properties.
function decimales_CreateFcn(hObject, eventdata, handles)
% hObject    handle to decimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cota_Callback(hObject, eventdata, handles)
% hObject    handle to cota (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cota as text
%        str2double(get(hObject,'String')) returns contents of cota as a double


% --- Executes during object creation, after setting all properties.
function cota_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cota (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
% hObject    handle to calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%matA=get(handles.A,'string');
matA=get(varargin.A, 'String');
A=str2num(matA);
matB=get(varargin.B, 'String');
%matB=get(handles.B,'string');
B=str2num(matB);
x0=[0 0 0]';
D=diag(diag(A)) ;
L=tril(A,-1) ;
U=triu(A,1) ;
x1=1;
xi=x0;

while abs(x1-xi)>10^-6 %Yo supongo que este tope tambien viene por parametro
    x1=-inv(D)*(L+U)*x0+inv(D)*B;
    xi=x0 ;
    x0 = x1;
end

r=x1

% --- Executes on button press in volver.
function volver_Callback(hObject, eventdata, handles)
% hObject    handle to volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)