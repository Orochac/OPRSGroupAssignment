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
    % JW,  2021/05/17, Created for MAST30013 Project
%% Function
function [smin, fmin, k] = NelderMeadSimplex(s0, nmbrSensors, sensorLocations)
    [smin, fmin] = fminsearch(@P, s0)
    k=0 % unknown because it's a matlab built in function
end