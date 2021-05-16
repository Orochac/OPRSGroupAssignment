%% Housingkeeping
% Inputs
    % s0: the single guess for the relay, 2d vector
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
% Outputs
    % smin: optimal relay location, 1 by 2 matrix, so just s0
    % fmin: optimal objective value, scalor
    % k: number of iterations, 1 bc single guess
% version history:
    % OR, Created for MAST30013 Project, 2021/05/16
%% Single guess, 
% A simple baseline to see if algorithm is better than just taking any
% point
function [smin, fmin, k] = singleGuess(s0, nmbrSensors, sensorLocations)
    smin = s0;
    fmin = P(s0, nmbrSensors, sensorLocations);
    k=1;
end