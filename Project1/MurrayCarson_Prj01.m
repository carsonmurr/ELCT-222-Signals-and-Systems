clc
clear all
format compact

%Variables
C=0.6e-6;
k0=5;
V0=10;
b=30;
C0=5;

%Time Intervals
x1=-2:0.1:0;
x2=0:0.1:2;
x3=2:0.1:4;
x4=4:0.1:5;
x5=5:0.1:8;

%Voltage
y1=0*ones(size(x1));
y2=k0*x2;
y3=V0*ones(size(x3));
y4=-k0*x4+b;
y5=C0*ones(size(x5));

x=[x1 x2 x3 x4 x5];
y=[y1 y2 y3 y4 y5];
nexttile
plot1=plot(x,y,'linewidth',2);
title ('Voltage')

%Current
y1=0*ones(size(x1));
y2=k0*C*ones(size(x2));
y3=0*ones(size(x3));
y4=-k0*C*ones(size(x4));
y5=0*ones(size(x5));

nexttile
x=[x1 x2 x3 x4 x5];
y=[y1 y2 y3 y4 y5];
plot2=plot(x,y,'linewidth',2);
title ('Current')

%Power
y1=0*ones(size(x1));
y2=k0*x2*k0*C;
y3=0*ones(size(x3));
y4=(-k0*x4+b)*-k0*C;
y5=0*ones(size(x5));

nexttile
x=[x1 x2 x3 x4 x5];
y=[y1 y2 y3 y4 y5];
plot3=plot(x,y,'linewidth',2);
title ('Power')

%Energy
y1=0*ones(size(x1));
y2=(k0*x2).^2*.5*C;
y3=(V0*ones(size(x3))).^2*.5*C;
y4=(-k0*x4+b).^2*.5*C;
y5=(C0*ones(size(x5))).^2*.5*C;


nexttile
x=[x1 x2 x3 x4 x5];
y=[y1 y2 y3 y4 y5];
plot4=plot(x,y,'linewidth',2);
title ('Electric Energy')