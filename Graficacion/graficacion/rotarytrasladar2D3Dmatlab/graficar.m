function varargout = graficar(varargin)
% GRAFICAR MATLAB code for graficar.fig
%      GRAFICAR, by itself, creates a new GRAFICAR or raises the existing
%      singleton*.
%
%      H = GRAFICAR returns the handle to a new GRAFICAR or the handle to
%      the existing singleton*.
%
%      GRAFICAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAFICAR.M with the given input arguments.
%
%      GRAFICAR('Property','Value',...) creates a new GRAFICAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before graficar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to graficar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help graficar

% Last Modified by GUIDE v2.5 26-Jan-2014 16:59:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @graficar_OpeningFcn, ...
                   'gui_OutputFcn',  @graficar_OutputFcn, ...
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


% --- Executes just before graficar is made visible.
function graficar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to graficar (see VARARGIN)

% Choose default command line output for graficar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes graficar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = graficar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
%FUNCIÓN EN 3D
global variables;
global x; 
global y; 
global z; 

%VALE '2' SI ES UNA FUNCIÓN DEL TIPO f(x,y)
variables = 2; 

x=linspace(-2*pi,2*pi,25); %arreglo de 25 valores -2pi a 2pi 
y=linspace(-2*pi,2*pi,25); 

s=get(handles.edit1,'string');
f=vectorize(inline(s));
[x,y] = meshgrid(x,y)
z=f(x,y);

%GRAFICAR DIRECTAMENTE DESPUÉS DE TECLEAR LA FUNCION f(x,y)
handles.axes1;
surfc(x,y,z)
axis([-20 20 -20 20 -20 20]); 


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%ÁNGULO INGRESADO POR EL CUAL SE ROTARÁ LA FUNCIÓN 
function edit2_Callback(hObject, eventdata, handles)
global angulo1;
angulo=get(handles.edit2,'string');  
angulo1 = str2num(angulo);



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



function edit3_Callback(hObject, eventdata, handles)
%FUNCIÓN EN 2D

%VARIABLES GLOBALES QUE SE UTILIZAN
global variables;
global x; 
global y; 
global z; 
global rotar
global salidaxx;
global salidayy;
global salidazz;

%ES '1' SI SE GRAFICA UNA FUNCIÓN DEL TIPO f(x)
variables = 1; 

s=get(handles.edit3,'string');   
f=vectorize(inline(s));

x = -10:0.5:10; 
u = f(x);
t = 90; 

%VECTORES DEL TAMAÑO DE 'X' QUE SE RELLENAN CON CEROS PARA INICIALIZARLOS Y
%DEPSUÉS UTILIZARLOS
salidaxx = zeros(size(x)); 
salidayy = zeros(size(x)); 
salidazz = zeros(size(x));

plot(x,u)

%VECTORIZAR VALORES DE LA FUNCIÓN f(x)
for ii=1:size(x,2)
   b = [x(ii) u(1,ii)] 
   vr = b;
   salidaxx(1,ii) = vr(1); 
   salidayy(1,ii) = vr(2);
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

global angulo1; %ÁNGULO QUE SE VA A ROTAR LA FUNCIÓN
global variables;
global rotar;
global x; 
global y;
global z;
th2 = angulo1; 
global salidaxx;
global salidayy;
global salidazz;
global tray1;
global res1;
global eje_a; 
global xk1; 
global yk1; 
global zk1; 
global m


switch rotar %ROTAR CON RESPECTO A X, Y o Z 
    %Rotar con respecto a X, 2D y 3D
    case 1  
        %Rotar en 2D
        if variables == 1 %SI ES IGUAL A 1 ES EN 2D
            co = [salidaxx; salidayy; salidazz];
             %Ángulo positivo 2D            
             if th2 >= 0
                 %Si se elige trayectoria 1 
                 if tray1 == 1
                    t = 0  : 360; %SE DIBUJA PRIMERO LA TRAYECTORIA QUE SE SEGUIRÁ
                    r = 3;
                    xc = r*cosd(t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2 %th SIEMPRE ES CERO, PERO res1 SE PUEDE CAMBIAR SU ASIGNACIÓN CONSTANTE POR UNA ASIGNACIÓN DE UNA VARIABLE
                            y1 = r*sind(th); %TRAYECTORIA QUE SE SEGUIRA
                            x1 = r*cosd(th);
                            z1 = 5; %ES LA ALTURA EN DONDE SE DIBUJARA LA TRAYECTORIA
                            Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)]; %MATRIZ DE ROTACIÓN 'X'
                            co_R = Rx*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc) %SE LE SUMA A CADA COORDENADA DE LA FUNCIÓN, LAS COORDENADAS DE LA TRAYECTORIA, 
                            %DE ESTA FORMA PARECERÁ COMO SI LA FUNCIÓN
                            %ESTUVIERA SIGUIENDO A LA TRAYECTORIA
                            grid
                            axis([-8 8 -8 8 -8 8]) %EJES X, Y y Z MÍNIMOS Y MÁXIMOS
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 2 
                 if tray1 == 2 %SI SE SELECCIONA EL BOTON DE TRAYECTORIA 2
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(5*t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(5*th);
                            z1 = 5; 
                            Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];
                            co_R = Rx*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 3
                 if tray1 == 3 %SI SE SELECCIONA EL BOTON DE TRAYECTORIA 3
                    t = 0  : 360;
                    r = 3;
                    xc = 2*r*cosd(t);
                    yc = r*sind(5*t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(5*th);
                            x1 = 2*r*cosd(th);
                            z1 = 5; 
                            Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];
                            co_R = Rx*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
             end
             %Ángulo negativo 2D             
             if th2 < 0 %SI EL ÁNGULO INTRODUCIDO POR EL USUARIO ES MENOR A CERO ENTONCES SE TIENE QUE ROTAR EN SENTIDO CONTRARIO
                 %Si se elige trayectoria 1 
                 if tray1 == 1
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2 %PARA ROTAR EN SENTIDO CONTRARIO SIMPLEMENTE SE MULTIPLICA res1 por '-1' PARA QUE SE VAYA MOVIENDO LA FUNCIÓN EN FORMA CONTRARIA 
                            y1 = r*sind(th);
                            x1 = r*cosd(th);
                            z1 = 5; 
                            Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];
                            co_R = Rx*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end 
                 %Si se elige trayectoria 2 
                 if tray1 == 2
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(5*t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(5*th);
                            z1 = 5; 
                            Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];
                            co_R = Rx*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 3
                 if tray1 == 3
                    t = 0  : 360;
                    r = 3;
                    xc = 2*r*cosd(t);
                    yc = r*sind(5*t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(5*th);
                            x1 = 2*r*cosd(th);
                            z1 = 5; 
                            Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];
                            co_R = Rx*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
             end
             
            salidaxx = co_R(1,:)                                 
            salidayy = co_R(2,:)
            salidazz = co_R(3,:)
        
        end
            %Rotar en 3D con respecto a X
            if variables == 2
                 if th2 >= 0
                     if tray1 == 1
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];  
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_x=Rx*vector_z;
                                         X(f,c)=Rot_x(1); 
                                         Y(f,c)=Rot_x(2);
                                         Z(f,c)=Rot_x(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end
                     
                     if tray1 == 2
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(5*t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(5*th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];  
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_x=Rx*vector_z;
                                         X(f,c)=Rot_x(1); 
                                         Y(f,c)=Rot_x(2);
                                         Z(f,c)=Rot_x(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                     if tray1 == 3
                         t = 0  : 360;
                         r = 3;
                         xc = 2*r*cosd(t);
                         yc = r*sind(5*t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(5*th);
                              x1 = 2*r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];  
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_x=Rx*vector_z;
                                         X(f,c)=Rot_x(1); 
                                         Y(f,c)=Rot_x(2);
                                         Z(f,c)=Rot_x(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                 end
                 
                 if th2 < 0
                     if tray1 == 1
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];  
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_x=Rx*vector_z;
                                         X(f,c)=Rot_x(1); 
                                         Y(f,c)=Rot_x(2);
                                         Z(f,c)=Rot_x(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end
                     
                     if tray1 == 2
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(5*t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(5*th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];  
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_x=Rx*vector_z;
                                         X(f,c)=Rot_x(1); 
                                         Y(f,c)=Rot_x(2);
                                         Z(f,c)=Rot_x(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                     if tray1 == 3
                         t = 0  : 360;
                         r = 3;
                         xc = 2*r*cosd(t);
                         yc = r*sind(5*t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(5*th);
                              x1 = 2*r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rx = [1 0 0;0 cosd(th) -sind(th);0 sind(th) cosd(th)];  
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_x=Rx*vector_z;
                                         X(f,c)=Rot_x(1); 
                                         Y(f,c)=Rot_x(2);
                                         Z(f,c)=Rot_x(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                 end
                 
            end
        
    %Rotar con respecto a Y     
    case 2
        %Rotar en 2D
        if variables == 1
            co = [salidaxx; salidayy; salidazz];
             %Ángulo positivo 2D            
             if th2 >= 0   
                 %Si se elige trayectoria 1 
                 if tray1 == 1
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(th);
                            z1 = 5; 
                            Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                            co_R = Ry*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 2 
                 if tray1 == 2
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(5*t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(5*th);
                            z1 = 5; 
                            Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                            co_R = Ry*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 3
                 if tray1 == 3
                    t = 0  : 360;
                    r = 3;
                    xc = 2*r*cosd(t);
                    yc = r*sind(5*t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(5*th);
                            x1 = 2*r*cosd(th);
                            z1 = 5; 
                            Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                            co_R = Ry*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
             end
             %Ángulo negativo 2D
             if th2 < 0
                 %Si se elige trayectoria 1 
                 if tray1 == 1
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(th);
                            z1 = 5; 
                            Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                            co_R = Ry*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end 
                 %Si se elige trayectoria 2 
                 if tray1 == 2
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(5*t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(5*th);
                            z1 = 5; 
                            Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                            co_R = Ry*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 3
                 if tray1 == 3
                    t = 0  : 360;
                    r = 3;
                    xc = 2*r*cosd(t);
                    yc = r*sind(5*t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(5*th);
                            x1 = 2*r*cosd(th);
                            z1 = 5; 
                            Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                            co_R = Ry*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
             end
             
            salidaxx = co_R(1,:)
            salidayy = co_R(2,:)
            salidazz = co_R(3,:)
        end
            %Rotar en 3D con respecto a Y
            if variables == 2
                
                 if th2 >= 0
                     if tray1 == 1
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_y=Ry*vector_z;
                                         X(f,c)=Rot_y(1); 
                                         Y(f,c)=Rot_y(2);
                                         Z(f,c)=Rot_y(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end
                     
                     if tray1 == 2
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(5*t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(5*th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_y=Ry*vector_z;
                                         X(f,c)=Rot_y(1); 
                                         Y(f,c)=Rot_y(2);
                                         Z(f,c)=Rot_y(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                     if tray1 == 3
                         t = 0  : 360;
                         r = 3;
                         xc = 2*r*cosd(t);
                         yc = r*sind(5*t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(5*th);
                              x1 = 2*r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_y=Ry*vector_z;
                                         X(f,c)=Rot_y(1); 
                                         Y(f,c)=Rot_y(2);
                                         Z(f,c)=Rot_y(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                 end
                 
                 if th2 < 0
                     if tray1 == 1
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_y=Ry*vector_z;
                                         X(f,c)=Rot_y(1); 
                                         Y(f,c)=Rot_y(2);
                                         Z(f,c)=Rot_y(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end
                     
                     if tray1 == 2
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(5*t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(5*th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_y=Ry*vector_z;
                                         X(f,c)=Rot_y(1); 
                                         Y(f,c)=Rot_y(2);
                                         Z(f,c)=Rot_y(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                     if tray1 == 3
                         t = 0  : 360;
                         r = 3;
                         xc = 2*r*cosd(t);
                         yc = r*sind(5*t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(5*th);
                              x1 = 2*r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Ry = [cosd(th) 0 sind(th);0 1 0;-sind(th) 0 cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_y=Ry*vector_z;
                                         X(f,c)=Rot_y(1); 
                                         Y(f,c)=Rot_y(2);
                                         Z(f,c)=Rot_y(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                 end
                 
          
            end 
        
    %Rotar con respecto a Z        
    case 3
        %Rotar en 2D
        if variables == 1
            co = [salidaxx; salidayy; salidazz];
            %res1 = 1;
             %Ángulo positivo 2D            
             if th2 >= 0   
             %Si se elige trayectoria 1 
                 if tray1 == 1
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(th);
                            z1 = 5; 
                            Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                            co_R = Rz*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 2 
                 if tray1 == 2
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(5*t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(5*th);
                            z1 = 5; 
                            Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                            co_R = Rz*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 3
                 if tray1 == 3
                    t = 0  : 360;
                    r = 3;
                    xc = 2*r*cosd(t);
                    yc = r*sind(5*t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(5*th);
                            x1 = 2*r*cosd(th);
                            z1 = 5; 
                            Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                            co_R = Rz*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end    
             end
             %Ángulo negativo 2D
             if th2 < 0   
                 %Si se elige trayectoria 1 
                 if tray1 == 1
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(th);
                            z1 = 5; 
                            Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                            co_R = Rz*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end 
                 %Si se elige trayectoria 2 
                 if tray1 == 2
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(5*t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(5*th);
                            z1 = 5; 
                            Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                            co_R = Rz*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 3
                 if tray1 == 3
                    t = 0  : 360;
                    r = 3;
                    xc = 2*r*cosd(t);
                    yc = r*sind(5*t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(5*th);
                            x1 = 2*r*cosd(th);
                            z1 = 5; 
                            Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                            co_R = Rz*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 
             end
        end
             
            salidaxx = co_R(1,:)
            salidayy = co_R(2,:)
            salidazz = co_R(3,:)
             
        end
            %Rotar en 3D con respecto a Z       
            if variables == 2
                
                 if th2 >= 0
                     if tray1 == 1
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_z=Rz*vector_z;
                                         X(f,c)=Rot_z(1); 
                                         Y(f,c)=Rot_z(2);
                                         Z(f,c)=Rot_z(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end
                     
                     if tray1 == 2
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(5*t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(5*th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_z=Rz*vector_z;
                                         X(f,c)=Rot_z(1); 
                                         Y(f,c)=Rot_z(2);
                                         Z(f,c)=Rot_z(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                     if tray1 == 3
                         t = 0  : 360;
                         r = 3;
                         xc = 2*r*cosd(t);
                         yc = r*sind(5*t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(5*th);
                              x1 = 2*r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_z=Rz*vector_z;
                                         X(f,c)=Rot_z(1); 
                                         Y(f,c)=Rot_z(2);
                                         Z(f,c)=Rot_z(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                 end
                 
                 if th2 < 0
                     if tray1 == 1
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_z=Rz*vector_z;
                                         X(f,c)=Rot_z(1); 
                                         Y(f,c)=Rot_z(2);
                                         Z(f,c)=Rot_z(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end
                     
                     if tray1 == 2
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(5*t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(5*th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_z=Rz*vector_z;
                                         X(f,c)=Rot_z(1); 
                                         Y(f,c)=Rot_z(2);
                                         Z(f,c)=Rot_z(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                     if tray1 == 3
                         t = 0  : 360;
                         r = 3;
                         xc = 2*r*cosd(t);
                         yc = r*sind(5*t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(5*th);
                              x1 = 2*r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         Rz = [cosd(th) -sind(th) 0; sind(th) cosd(th) 0; 0 0 1];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_z=Rz*vector_z;
                                         X(f,c)=Rot_z(1); 
                                         Y(f,c)=Rot_z(2);
                                         Z(f,c)=Rot_z(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                 end
                 
          
               
            end
    %Rotar con respecto a eje arbitrario         
    case 4
    
       xk = get(handles.edit6,'String');
       xk1 = str2num(xk); %Componente 'X' del vector arbitrario
       yk = get(handles.edit7,'String');
       yk1 = str2num(yk); %Componente 'Y' del vector arbitrario
       zk = get(handles.edit8,'String');
       zk1 = str2num(zk); %Componente 'Z' del vector arbitrario
       m=sqrt((xk1^2)+(yk1^2)+(zk1^2)); %Obtención de la magnitud del vector arbitrario  
       eje_a=[xk1/m; yk1/m; zk1/m]; %Vector unitario con dirección del vector arbitrario
        
        if variables == 1
            co = [salidaxx; salidayy; salidazz];
            %res1 = 1;
             %Ángulo positivo 2D            
             if th2 >= 0   
             %Si se elige trayectoria 1 
                 if tray1 == 1
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(th);
                            z1 = 5; 
                            vo=1-cosd(th);
                            R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                            co_R = R_eje_a*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 2 
                 if tray1 == 2
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(5*t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(5*th);
                            z1 = 5; 
                            vo=1-cosd(th);
                            R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                            co_R = R_eje_a*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 3
                 if tray1 == 3
                    t = 0  : 360;
                    r = 3;
                    xc = 2*r*cosd(t);
                    yc = r*sind(5*t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:res1:th2  
                            y1 = r*sind(5*th);
                            x1 = 2*r*cosd(th);
                            z1 = 5; 
                            vo=1-cosd(th);
                            R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                            co_R = R_eje_a*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end    
             end
             %Ángulo negativo 2D
             if th2 < 0   
                 %Si se elige trayectoria 1 
                 if tray1 == 1
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(th);
                            z1 = 5; 
                            vo=1-cosd(th);
                            R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                            co_R = R_eje_a*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end 
                 %Si se elige trayectoria 2 
                 if tray1 == 2
                    t = 0  : 360;
                    r = 3;
                    xc = r*cosd(5*t);
                    yc = r*sind(t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(th);
                            x1 = r*cosd(5*th);
                            z1 = 5; 
                            vo=1-cosd(th);
                            R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                            co_R = R_eje_a*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 end
                 %Si se elige trayectoria 3
                 if tray1 == 3
                    t = 0  : 360;
                    r = 3;
                    xc = 2*r*cosd(t);
                    yc = r*sind(5*t);
                    zc = ones(1, length(xc))*5;    
                         for th=0:-res1:th2  
                            y1 = r*sind(5*th);
                            x1 = 2*r*cosd(th);
                            z1 = 5; 
                            vo=1-cosd(th);
                            R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                            co_R = R_eje_a*co;
                            plot3(co_R(1,:)+x1,co_R(2,:)+y1,co_R(3,:)+z1,'r',xc,yc,zc)
                            grid
                            axis([-8 8 -8 8 -8 8])
                            pause(0.01)
                         end
                 
             end
        end
             
            salidaxx = co_R(1,:)
            salidayy = co_R(2,:)
            salidazz = co_R(3,:)
             
        end
        
        %Rotar con respecto a eje arbitrario en 3D
        if variables == 2
                
                 if th2 >= 0
                     if tray1 == 1
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         vo=1-cosd(th);
                                         R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_eje_a1=R_eje_a*vector_z;
                                         X(f,c)=Rot_eje_a1(1); 
                                         Y(f,c)=Rot_eje_a1(2);
                                         Z(f,c)=Rot_eje_a1(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end
                     
                     if tray1 == 2
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(5*t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(5*th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         vo=1-cosd(th);
                                         R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_eje_a1=R_eje_a*vector_z;
                                         X(f,c)=Rot_eje_a1(1); 
                                         Y(f,c)=Rot_eje_a1(2);
                                         Z(f,c)=Rot_eje_a1(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                     if tray1 == 3
                         t = 0  : 360;
                         r = 3;
                         xc = 2*r*cosd(t);
                         yc = r*sind(5*t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:res1:th2  
                              y1 = r*sind(5*th);
                              x1 = 2*r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         vo=1-cosd(th);
                                         R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_eje_a1=R_eje_a*vector_z;
                                         X(f,c)=Rot_eje_a1(1); 
                                         Y(f,c)=Rot_eje_a1(2);
                                         Z(f,c)=Rot_eje_a1(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                 end
                 
                 if th2 < 0
                     if tray1 == 1
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         vo=1-cosd(th);
                                         R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_eje_a1=R_eje_a*vector_z;
                                         X(f,c)=Rot_eje_a1(1); 
                                         Y(f,c)=Rot_eje_a1(2);
                                         Z(f,c)=Rot_eje_a1(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end
                     
                     if tray1 == 2
                         t = 0  : 360;
                         r = 3;
                         xc = r*cosd(5*t);
                         yc = r*sind(t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(th);
                              x1 = r*cosd(5*th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         vo=1-cosd(th);
                                         R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_eje_a1=R_eje_a*vector_z;
                                         X(f,c)=Rot_eje_a1(1); 
                                         Y(f,c)=Rot_eje_a1(2);
                                         Z(f,c)=Rot_eje_a1(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                     if tray1 == 3
                         t = 0  : 360;
                         r = 3;
                         xc = 2*r*cosd(t);
                         yc = r*sind(5*t);
                         zc = ones(1, length(xc))*5;    
                            for th=0:-res1:th2  
                              y1 = r*sind(5*th);
                              x1 = 2*r*cosd(th);
                              z1 = 5;
                                for c=1:25
                                     for f=1:25
                                         vo=1-cosd(th);
                                         R_eje_a = [(eje_a(1)^2)*vo+cosd(th), eje_a(1)*eje_a(2)*vo-eje_a(3)*sind(th), eje_a(1)*eje_a(3)*vo+eje_a(2)*sind(th); eje_a(1)*eje_a(2)*vo+eje_a(3)*sind(th), (eje_a(2)^2)*vo+cosd(th), eje_a(2)*eje_a(3)*vo-eje_a(1)*sind(th); eje_a(1)*eje_a(3)*vo-eje_a(2)*sind(th), eje_a(2)*eje_a(3)*vo+eje_a(1)*sind(th), (eje_a(3)^2)*vo+cosd(th)];
                                         vector_z = [x(f,c);y(f,c);z(f,c)]; 
                                         Rot_eje_a1=R_eje_a*vector_z;
                                         X(f,c)=Rot_eje_a1(1); 
                                         Y(f,c)=Rot_eje_a1(2);
                                         Z(f,c)=Rot_eje_a1(3);
                                     end
                               end
                              surf(X+x1,Y+y1,Z+z1)
                              axis([-20 20 -20 20 -20 20]);
                              pause(0.1);
                            end
                     end 
                     
                 end
                 
          
               
            end
        
    
end    



% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global res1; 
v_vel = get(handles.slider1,'Value') 
res1 = v_vel; %VELOCIDAD DE LA ANIMACION
set(handles.text11,'String',fix(v_vel))


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
v_t = get(handles.popupmenu1,'Value')
global tray1; 
switch v_t  %SE ELIGE LA TRAYECTORIA
    case 1 
        tray1 = 1; 
    case 2 
        tray1 = 2; 
    case 3 
        tray1 = 3;       
end 

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
v_r = get(handles.popupmenu2,'Value')

global rotar; 
global xk1; 
global yk1; 
global zk1; 
global m
global eje_a

switch v_r %SE ELIGE EL EJE CON RESPECTO A CUAL ROTAR
    case 1 
        rotar = 1; 
    case 2 
        rotar = 2; 
    case 3 
       rotar = 3;  
    case 4 
       rotar = 4; 
end 


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
