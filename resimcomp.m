function varargout = resimcomp(varargin)
% RESIMCOMP M-file for resimcomp.fig
%      RESIMCOMP, by itself, creates a new RESIMCOMP or raises the existing
%      singleton*.
%
%      H = RESIMCOMP returns the handle to a new RESIMCOMP or the handle to
%      the existing singleton*.
%
%      RESIMCOMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESIMCOMP.M with the given input arguments.
%
%      RESIMCOMP('Property','Value',...) creates a new RESIMCOMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before resimcomp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to resimcomp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help resimcomp

% Last Modified by GUIDE v2.5 18-May-2012 03:33:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @resimcomp_OpeningFcn, ...
                   'gui_OutputFcn',  @resimcomp_OutputFcn, ...
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


% --- Executes just before resimcomp is made visible.
function resimcomp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to resimcomp (see VARARGIN)

% Choose default command line output for resimcomp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes resimcomp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = resimcomp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sec.
function sec_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.m', 'Select a MATLAB code file');
handles.isim = filename;

if isequal(filename,0)
   disp('User selected Cancel')
elseif filename((length(filename)-3):length(filename)) == 'comp'
    handles.l = importdata(filename);
else
   handles.k=imread(fullfile(pathname, filename));
   axes(handles.axes1);
   imshow(handles.k);
end
guidata(hObject, handles);

% --- Executes on button press in comp.
function comp_Callback(hObject, eventdata, handles)
    
    set(handles.mevcut,'String','sýkýþtýrýyor...');
    pause(1);
    handles.press = govde(handles.k,'comp',handles.katsayi1);
    gecici=handles.press;
    name = strcat(handles.isim(1:(length(handles.isim)-3)),'comp');
    savefile = name;
    save(savefile, 'gecici');
    
    resim = java.io.File(handles.isim);
    mboy=length(resim);
    mboys=num2str(mboy);
    sresim = java.io.File(name);
    sboy = length(sresim);
    
    sboys=num2str(sboy);
    mboys = strcat('resmin boyutu :',' ',mboys,' byte');
    sboys = strcat('sýkýþtýrýlmýþ boyut :',' ',sboys,' byte');
    
    soran = 100*((mboy-sboy)/mboy);
    sorans = num2str(soran);
    sorans = strcat('sýkýþtýrma oraný :%',sorans);
    set(handles.veri2,'String',sorans);
    set(handles.mevcut,'String',mboys);
    set(handles.sonra,'String',sboys);
    
    
guidata(hObject, handles);

% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
    set(handles.veri1,'String','resim açýlýyor...');
    pause(1);
    handles.acik= govde(handles.l,'open',handles.katsayi2);
    
    axes(handles.axes2);
    imshow(handles.acik);
    
    
    set(handles.veri1,'String','sýkýþtýrmasonrasý açýlmýþ resim');
    
guidata(hObject, handles);


% --- Executes on mouse press over axes background.



function so_Callback(hObject, eventdata, handles)
    handles.katsayi1 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function so_CreateFcn(hObject, eventdata, handles)
% hObject    handle to so (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
    handles.katsayi2 = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


