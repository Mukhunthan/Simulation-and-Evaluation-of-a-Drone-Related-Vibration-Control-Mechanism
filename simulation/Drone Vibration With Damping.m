clc;
clear;
close all;

% System parameters
m = 1;      % Mass (kg)
c = 2;      % Damping coefficient
k = 20;     % Spring stiffness

% Time
t = 0:0.01:10;

% Initial conditions
x0 = 0.1;   % Initial displacement
v0 = 0;     % Initial velocity

% Differential equation
A = [0 1; -k/m -c/m];
B = [0; 1/m];
C = [1 0];
D = 0;

sys = ss(A,B,C,D);

% No external force
u = zeros(size(t));

% Simulation
[y,t,x] = lsim(sys,u,t,[x0 v0]);

% Plot
figure
plot(t,y,'LineWidth',2)
xlabel('Time (seconds)')
ylabel('Displacement (meters)')
title('Drone Vibration Response with Damping')
grid on
