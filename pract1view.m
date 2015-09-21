function varargout = pract1view(varargin)
% PRACT1VIEW MATLAB code for pract1view.fig
%      PRACT1VIEW, by itself, creates a new PRACT1VIEW or raises the existing
%      singleton*.
%
%      H = PRACT1VIEW returns the handle to a new PRACT1VIEW or the handle to
%      the existing singleton*.
%
%      PRACT1VIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACT1VIEW.M with the given input arguments.
%
%      PRACT1VIEW('Property','Value',...) creates a new PRACT1VIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pract1view_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pract1view_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help pract1view
% Last Modified by GUIDE v2.5 20-Sep-2015 17:41:32
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pract1view_OpeningFcn, ...
                   'gui_OutputFcn',  @pract1view_OutputFcn, ...
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

% --- Executes just before pract1view is made visible.
function pract1view_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pract1view (see VARARGIN)

% Choose default command line output for pract1view
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using pract1view.
if strcmp(get(hObject,'Visible'),'off')
    plot4classes( hObject, handles);
    %plot(rand(5));
end

% UIWAIT makes pract1view wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pract1view_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in doAction.
function doAction_Callback(hObject, eventdata, handles)
  % hObject    handle to doAction (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)
  input= get(handles.eTvector,'String');
  if isempty(input)
      msgbox('Please type a vector','Warning');
      return
  end
  vector = [str2num(input)];

  if size(vector) ~= 2
    msgbox('please type a R2 vector');
    return
  end

  axes(handles.axes1);
  cla;

  plot4classes( hObject, handles);

  popup_sel_index = get(handles.criteria_menu, 'Value');
  switch popup_sel_index
      case 1
          %plot(rand(5,1000));
           minimumDistanceCriterion(hObject, handles, vector);
      case 2
          %plot(sin(1:0.01:25.99));
          mahalanobisDistanceCriterion(hObject, handles, vector);
      case 3
          bar(1:.5:10);
      case 4
          plot(membrane);
      case 5
          surf(peaks);
  end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in criteria_menu.
function criteria_menu_Callback(hObject, eventdata, handles)
% hObject    handle to criteria_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns criteria_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from criteria_menu


% --- Executes during object creation, after setting all properties.
function criteria_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to criteria_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end
   % set(hObject,'BackgroundColor','blue');

set(hObject, 'String', {'Minimum distance', 'Mahalanobis distance', 'cube case', 'Automatic class generation', 'test'});



function eTvector_Callback(hObject, eventdata, handles)
% hObject    handle to eTvector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eTvector as text
%        str2double(get(hObject,'String')) returns contents of eTvector as a double


% --- Executes during object creation, after setting all properties.
function eTvector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eTvector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function plot4classes( hObject, handles )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    c1 = [0 1 0 1 2; 0 1 1 0 0];
    c2 = [4 4 4 5 5; 1 2 4 2 4];
    c3 = [1 2 1 2 2; 4 4 5 5 6];
    c4 = [5 7 5 7 6; 6 6 8 8 7];
    handles.c1=c1;
    handles.c2=c2;
    handles.c3=c3;
    handles.c4=c4;
    guidata(hObject,handles)
    axes(handles.axes1);
    cla;

    plot(c1(1,:), c1(2,:), 'r+','MarkerSize',20,'LineWidth',5)
    grid on
    hold on % es para que no borre lo que ya estaba
    plot(c2(1,:), c2(2,:), 'bo','MarkerSize',20,'LineWidth',5)
    plot(c3(1,:), c3(2,:), 'cs','MarkerSize',20,'LineWidth',5)
    plot(c4(1,:), c4(2,:), 'k>','MarkerSize',20,'LineWidth',5)

function minimumDistanceCriterion(hObject, handles, vector)
  grid on
  hold on
  plot(vector(1), vector(2), 'g*', 'MarkerSize', 20, 'LineWidth',5)
  media1 = mean(handles.c1,2);
  media2 = mean(handles.c2,2);
  media3 = mean(handles.c3,2);
  media4 = mean(handles.c4,2);
  distancias(1) = norm(vector' - media1);
  distancias(2) = norm(vector' - media2);
  distancias(3) = norm(vector' - media3);
  distancias(4) = norm(vector' - media4);
  belongsClass = 1;
  for i=1:4
      if distancias(belongsClass) > distancias(i)
        belongsClass=i;
      end
  end
  distancias
  msgbox(['The vector belongs at class ', num2str(belongsClass)],'Result');

function mahalanobisDistanceCriterion(hObject, handles, vector)
  grid on
  hold on
  plot(vector(1), vector(2), 'g*', 'MarkerSize', 20, 'LineWidth',5)
  media1 = mean(handles.c1,2);
  media2 = mean(handles.c2,2);
  media3 = mean(handles.c3,2);
  media4 = mean(handles.c4,2);
  means=[media1,media2,media3,media4];
  matrix0 = cat(3,handles.c1, handles.c2, handles.c3, handles.c4);
  matrix1=matrix0;
  matrixS=cat(3,zeros(size(matrix0,1)),zeros(size(matrix0,1)),zeros(size(matrix0,1)),zeros(size(matrix0,1)));
  for i=1:size(matrix0,3)
    for j=1:size(matrix0,2)
      matrix1(:,j,i)=matrix0(:,j,i)-means(:,i);
    end
    matrixS(:,:,i)  =matrix1(:,:,i) * matrix1(:,:,i)';
    results(i)=((vector-means(:,i)')*matrixS(:,:,i))*(vector-means(:,i)')';
  end
  
  belongsClass=1;
  for i=1:4
      if results(belongsClass) > results(i)
        belongsClass=i;
      end
  end
  results
  msgbox(['The vector belongs at class ', num2str(belongsClass)],'Result');
  