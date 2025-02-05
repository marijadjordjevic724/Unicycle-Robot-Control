%% Constants and Parameters
% This script is used in order to have a better overview of the parameters of the
% system that can be changed

%% Trajectory
T = 2*pi; % Time to draw the circle
r=1; % Radius of the circle
dt = 0.01;
t_values = 0:dt:T*1.1; % Little bigger than whats needed to draw 
initial_position = [0,r];


%% Trajectory tracking controller 

% 1- General control scheme with flatness
natural_frequency = 10;
damping_coeff = 1/sqrt(2);

%2 - Controller without flatness
params.r=1; % Radius of the circle
params.b = 0.001; % offset constant
params.dt = 0.01;
state.x = 0; 
state.y = 0; 
state.theta = 0;
params.kp1=45;
params.kp2=45;

%% Obstacle detection: circle around the obstacle
% hypothesis - center of the obstacle is on the trajectory

% For circle

% obs_x =[20];
% obs_y =[20];
% 
% obs_x =[r*sin(pi/2)];
% obs_y =[r*cos(pi/2)];

% obs_x =[r*sin(pi/2),r*sin(4*pi/3)];
% obs_y =[r*cos(pi/2),r*cos(4*pi/3)];
% 
% obs_x =[r*sin(pi/2),r*sin(5*pi/8)];
% obs_y =[r*cos(pi/2),r*cos(5*pi/8)];

% For infinity
obs_x =[20];
obs_y =[20];

% obs_x =[r*cos(8/3*pi)-1];
% obs_y =[r*sin(2*8/3*pi)/2+1];

% obs_x =[r*cos(8/3*pi)-1,-1.8];
% obs_y =[r*sin(2*8/3*pi)/2+1,0.52];

%For triangle
% obs_x =[0.8,1.94, 3.38];
% obs_y =[2.2,3.91,1.93];

%For rectangle
% obs_x =[2,0, 2];
% obs_y =[3,2,1];

obs =[obs_x;obs_y]
v_max = 100;
omega_max = 100;
obs_r = 0.1;
threshold = 0.2;
d = obs_r+threshold; % Radius of the avoidance trajectory

%% Regulation task: 
% these constants not needed
% the coefficients of the controller are in the simulink scheme directly
parking_position = [0,0];
parking_angle = 0;


