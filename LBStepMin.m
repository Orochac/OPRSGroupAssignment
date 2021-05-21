%% Housingkeeping
% Inputs
    % s: location for the relay, 2d vector
    % d: The direction travelling in, 2d vector
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
    % farthestSensor: 2d vector
    % alpha: the alpha value of LB method, scalor
% Outputs
    % smin: optimal relay location, 1 by 2 matrix
    % fmin: optimal objective value, scalor
    % k: number of iterations
% version history:
    % LQ, Created for MAST30013 Project, 2021/05/21
%% LB step minimiser function, 
% This is a function to identify a valid step size
function t = LBStepMin(s, d, nmbrSensors, sensorLocations, farthestSensor, alpha)
   function f = stepSize(t)
       f = LBFunction(s+t.*transpose(d), nmbrSensors, sensorLocations, farthestSensor, alpha);
   end
   %fplot(@(t) stepSize(t), [-1 1])
   tlo = 0.001;
   thigh = 5;
   t = fminbnd(@stepSize,tlo,thigh);
end