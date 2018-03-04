% Copyright: 2018 - Teknik Geofisika, Universitas Pertamina
% URL: https://sites.google.com/site/metkomup/programming
% Cite: Suryahadinata, Ketut T.; Ardiyanto, Dimas; Rustianto, Raffly; Baihaqi, Reyhan; 
% Janapriyandana, Shri I.; Lobo, Ryru K. (2018): Analisa Spline Berbasis Graphical User Interface (GUI). figshare.
% https://doi.org/10.6084/m9.figshare.5946754

%FUNGSI YANG AUTOMATIS KELUAR SAAT MEMBUAT GUI
function varargout = ANALISISISISSPLINE(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ANALISISISISSPLINE_OpeningFcn, ...
                   'gui_OutputFcn',  @ANALISISISISSPLINE_OutputFcn, ...
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

function ANALISISISISSPLINE_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = ANALISISISISSPLINE_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%Browse File Pada Tombol [Input Data]
function pushbutton1_Callback(hObject, eventdata, handles)
filename= uigetfile({'*.txt'},'File Selector');
open = strcat(filename);
xy = load (open);
x=xy(:,1);
hold on
plot(x,'*b','LineWidth',1);
grid on
hold off

%Memasukan Jumlah Titik Spline 1
function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Plot Titik Spline 1
function pushbutton2_Callback(hObject, eventdata, handles)
global reset1;
hold on
n = str2double(get(handles.edit1,'String'));
[x1,y1]=ginput(n);
grid on
 u = linspace(0,20,100);
 v = spline(x1,y1,u);
 has=[u',v'];
 reset1 = plot(u,v,'r','LineWidth',1)
 xlim([min(x1) max(x1)])
 legend('Data','SPLINE','Location','NorthEast')
 save ('HASILSPLINE1.txt', 'has','-ASCII')
 hold off
 guidata(hObject,handles);

 %Memasukan Jumlah Titik Spline 2
function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Plot Titik Spline 2
function pushbutton3_Callback(hObject, eventdata, handles)
global reset2;
hold on
n = str2double(get(handles.edit2,'String'));
[x1,y1]=ginput(n);
grid on
 u = linspace(0,20,100);
 v = spline(x1,y1,u);
 has=[u',v'];
 reset2 = plot(u,v,'g','LineWidth',1)
 xlim([min(x1) max(x1)])
 legend('Data','Spline 1','Spline 2','Location','NorthEast')
 save ('HASILSPLINE2.txt', 'has','-ASCII')
 hold off
guidata(hObject,handles);

%Mereset Semua
function pushbutton4_Callback(hObject, eventdata, handles)
cla (handles.axes1,'reset');

%Mereset Spline 1
function pushbutton5_Callback(hObject, eventdata, handles)
global reset1;
delete(reset1);
guidata(hObject,handles);

%Mereset Spline 2
function pushbutton6_Callback(hObject, eventdata, handles)
global reset2;
delete(reset2);
guidata(hObject,handles);
