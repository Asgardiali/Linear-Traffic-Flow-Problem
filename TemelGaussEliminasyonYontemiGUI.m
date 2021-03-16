function varargout = TemelGaussEliminasyonYontemiGUI(varargin)

gui_Singleton = 1;

gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TemelGaussEliminasyonYontemiGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TemelGaussEliminasyonYontemiGUI_OutputFcn, ...
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

function TemelGaussEliminasyonYontemiGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = TemelGaussEliminasyonYontemiGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

resim=imread('OdevResim.jpg');
imshow(resim);



function k1_Callback(hObject, eventdata, handles)

function k1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k2_Callback(hObject, eventdata, handles)

function k2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k4_Callback(hObject, eventdata, handles)

function k4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k5_Callback(hObject, eventdata, handles)

function k5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k6_Callback(hObject, eventdata, handles)

function k6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function calc_Callback(hObject, eventdata, handles)

k1=str2double(get(handles.k1,'string'));
k2=str2double(get(handles.k2,'string'));
k4=str2double(get(handles.k4,'string'));
k5=str2double(get(handles.k5,'string'));
k6=str2double(get(handles.k6,'string'));

syms x1 x3 x5 x6;

katsayi=[1 0 1 0;1 0 0 1;0 -1 0 1;0 -1 1 0];        % Verilen sistemi denklem haline getirilirse

x=[x1;x3;x5;x6];

k=[k1;k2;k6;k5-k4];

gauss=[katsayi k];                                  % Gauss Eliminasyon Y�ntemi Ba�lang�c�

gauss(2,:)=(gauss(2,:)-gauss(1,:));                 % Birinci ad�m 1.sat�r� -1 ile �arp�l�yor ve 2. sat�ra ekleniyor.

change=gauss(2,:);                                  % �kinci ad�m 2.sat�r ile 3.sat�r yer de�i�tiriyor.
gauss(2,:)=gauss(3,:);
gauss(3,:)=change;

gauss(2,:)=-gauss(2,:);                             % ���nc� ad�m 2.sat�r� negatif yapt�m.

gauss(4,:)=gauss(2,:)+gauss(4,:);                   % D�rd�nc� ad�m 4.sat�r ile 2.sat�r toplad�m.

gauss(3,:)=-gauss(3,:);                             % Be�inci ad�m 3.sat�r� -1 ile �arpt�m.

gauss(4,:)=gauss(4,:)-gauss(3,:);                   % Alt�nc� ad�m 3.sat�r� ile 4.sat�ra toplad�m.

gauss(1,:)=gauss(1,:)-gauss(3,:);


result=gauss(:,5);

yeniKatsayiler=[gauss(:,1) gauss(:,2) gauss(:,3) gauss(:,4)];

if(gauss(4,1)==0 && gauss(4,2)==0 && gauss(4,3)==0 && gauss(4,4)==0 && gauss(4,5)~=0)
    f = msgbox({'Bu denklem sisteminin ��z�m� yoktur.';'L�tfen farkl� bir sistem deneyiniz...'});
    
else    
denklem=yeniKatsayiler*x==result;

% x3 max min de�erlerine g�re di�er de�i�kenlerin max min de�erlerini bulmak i�in ded�i�ken tan�mlad�m.
% Elde etti�im t�m denklemleri x3'�n min max de�erlerine g�re ayr� ayr� ��zd�rd�m. Sonras�nda buldu�um de�erleri �ektim.
x3degermin=20;
asd=subs(denklem(2),{x3},{x3degermin});
x6degermin=solve(asd);
asd=subs(denklem(3),{x6},{x6degermin});
x5degermin=solve(asd);
asd=subs(denklem(1),{x6},{x6degermin});
x1degermin=solve(asd);

x3degermax=50;
asd=subs(denklem(2),{x3},{x3degermax});
x6degermax=solve(asd);
asd=subs(denklem(3),{x6},{x6degermax});
x5degermax=solve(asd);
asd=subs(denklem(1),{x6},{x6degermax});
x1degermax=solve(asd);

% Max Min de�erleri i�in tablo olu�turdum.

data=[];

data(1,1)=x1degermin;
data(1,2)=x1degermax;
data(2,1)=x3degermin;
data(2,2)=x3degermax;
data(3,1)=x5degermin;
data(3,2)=x5degermax;
data(4,1)=x6degermin;
data(4,2)=x6degermax;

set(handles.dataTable,'data',data);

end
