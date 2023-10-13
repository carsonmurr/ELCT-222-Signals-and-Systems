clear all;
clc;
R=0.5e6;
C=1e-6;

 % Code for input voltage 
delta=0.001; % Time increment
tS_x=-2; % Start time for x(t)
tE_x=6; % End time for x(t)
tx=[tS_x:delta:tE_x]; % Time period considered for x(t)

x= ustep(tx)-ustep(tx-1);
nexttile;
plot1=plot(tx,x,'linewidth',2);
axis([-2 6 0 1.2]);
grid on;
title("Input of RC Circuit Vin(t)");
xlabel('\it t'); % Use italic "t" to label x-axis
ylabel('{\bf Vin}({\it t})'); % Use boldface “h" to label y-axis


% Code for impulse response h(t)

tS_h=-2; % Start time for h(t)
tE_h=6; % End time for h(t)
th=[tS_h:delta:tE_h]; % Time period considered for h(t)
tauC=R*C; % tauC=RC is defined as the time constant
h=(exp(-th/tauC)/tauC).*ustep(th); % RC circuit impulse response
y=conv(x,h)*delta; % output voltage of the capacitor
ty=[tS_x+tS_h:delta:tE_x+tE_h]; % Time dimension for the convoluted output

nexttile
plot2=plot(th, h, 'b','linewidth',2); % Plot t vs h(t) in figure1
xlabel('\it t'); % Use italic "t" to label x-axis
ylabel('{\bf h}({\it t})'); % Use boldface “h" to label y-axis
title('Impulse Response of RC Circuit h(t)');
axis([-2 6 0 2.2]); grid;

% Code for output of RC Circuit
nexttile
plot3=plot(ty, y, 'r','linewidth',2); % Plot t vs y in figure1
xlabel('\it t'); % Use italic "t" to label x-axis
ylabel('{\bf Vout}({\it t})'); % Use boldface “y(t)" to label y-axis
title('Output of RC Circuit Vout(t)');
axis([-2 6 0 1]); grid;

% Code for electric Energy stored in capacitor
w =(y.^2)*C*0.5;
nexttile
plot4=plot(ty, w, 'g', 'LineWidth',2);
xlabel('\it t'); % Use italic "t" to label x-axis
ylabel('{\bf w}({\it t})'); % Use boldface “y(t)" to label y-axis
title('Energy w(t)');
axis([-2 6 0 1e-6]); grid;

