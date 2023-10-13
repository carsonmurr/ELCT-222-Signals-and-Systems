clc;
clear;
close all;

divisions = 0.01;
time = 0:divisions:6;

%desired output
Vout = 10;  %change value to 10, 12, or 15 to compare to LTSpice

%input pulse
Vin=3;

%RC calculation
RC = Vin*2/Vout;
disp(RC)
y=((ustep(time)-ustep(time-2))*-Vin/RC).*time+ ...
    (ustep(time-2)-ustep(time-4))*Vin/RC.*time+...
    (ustep(time-2)-ustep(time-4))*(-2*Vin*2/RC);

figure(1)
plot(time,y)
hold on;
grid on;


x1=0:1:0;
eq1 = (0*x1); % Sub-function 1
 
x2=0:1:2;
eq2 = (0*x2)+3;       % Sub-function 2
 
x3=2:1:4;
eq3 = (0*x3)-3;    % Sub-function 3

x4=4:1:4;
eq4= (0*x4)+3;

x5=6:1:6;
eq5=(0*x5);

x = [x1 x2 x3 x4];
y = [eq1 eq2 eq3 eq4];
plot(x, y)
grid on;
hold off;
