%% Housingkeeping
% Inputs
    % s0: initial relay location, 1 by 2 matrix
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
% Outputs
    % smin: optimal relay location, 1 by 2 matrix
    % fmin: optimal objective value, scalor
    % k: number of iterations
% version history:
    % JW, Created for MAST30013 Project, 2021/05/15
%% Function
function [smin, fmin, k] = sampleAlgorithm(s0, nmbrSensors, sensorLocations)
    smin = rand(1,2);
    fmin = rand();
    k = round(rand()*1000);
end