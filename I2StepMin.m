%% Housingkeeping
% Inputs
    % s: location for the relay, 2d vector
    % d: The direction travelling in, 2d vector
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
    % farthestSensor: 2d vector
    % alpha: the alpha value of I2 method, scalor
% Outputs
    % smin: optimal relay location, 1 by 2 matrix
    % fmin: optimal objective value, scalor
    % k: number of iterations
% version history:
    % OR, Created for MAST30013 Project, 2021/05/18
%% I2 step minimiser function, 
% This is a function to identify a valid step size
function t = I2StepMin(s, d, nmbrSensors, sensorLocations, farthestSensor, alpha)
   function f = stepSize(t)
       f = I2Function(s+t*transpose(d), nmbrSensors, sensorLocations, farthestSensor, alpha);
   end
   tlo = 0;
   thigh = 10;
   t = fminbnd(@stepSize,tlo,thigh);
end