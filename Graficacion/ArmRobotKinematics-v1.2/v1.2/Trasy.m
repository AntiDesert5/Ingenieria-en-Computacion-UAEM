%%------------------------------------------------------------------
%% (c) Juan Gonzalez-Gomez (Obijuan)  juan@iearobotics.com
%% Abril-2012
%%------------------------------------------------------------------
%% Matriz homogenea de traslación a lo largo del eje y

function T=Trasy(l)

T = [1  0  0  0;
     0  1  0  l;
     0  0  1  0;
     0  0  0  1];
     
