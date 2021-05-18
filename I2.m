%% Housingkeeping
% Inputs
    % s0: starting location for the relay, 2d vector
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
% Outputs
    % smin: optimal relay location, 1 by 2 matrix
    % fmin: optimal objective value, scalor
    % k: number of iterations
% version history:
    % OR, Created for MAST30013 Project, 2021/05/16
%% I2 penalty function, 
% This is the I2 penalty method with the variable alpha
function [smin, fmin, k] = I2(s0, nmbrSensors, sensorLocations)
    alpha = 10;%alpha value
    k =0;
    fscores = zeros(nmbrSensors, 1);%create vector of each result
    slocations = zeros(nmbrSensors, 2);%create matrix of relay locations
    for i = 1:nmbrSensors %need to minimise each of the cases
        farthestSensor = sensorLocations(i,:);
        [slocations(i,:), fscores(i), itter] = I2Optimise(s0, nmbrSensors, sensorLocations, farthestSensor, alpha);
        k = k+itter;
        %check if valid
    end
    [fmin, I] = min(fscores);
    smin = slocations(I,:);
end