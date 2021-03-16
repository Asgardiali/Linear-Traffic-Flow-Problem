function varargout = DogrusalTrafikAkisProblemi(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DogrusalTrafikAkisProblemi_OpeningFcn, ...
                   'gui_OutputFcn',  @DogrusalTrafikAkisProblemi_OutputFcn, ...
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

function DogrusalTrafikAkisProblemi_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = DogrusalTrafikAkisProblemi_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function buton1_Callback(hObject, eventdata, handles)
TemelGaussEliminasyonYontemiGUI;

function buton2_Callback(hObject, eventdata, handles)
PivotlamaileGaussEliminasyonYontemiGUI;

function buton3_Callback(hObject, eventdata, handles)
GaussJordanWithRowPivotingYontemiGUI;
