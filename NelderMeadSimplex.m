%% Housingkeeping
% Inputs
    % s0: initial relay location, 1 by 2 matrix
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
% Outputs
    % smin: optimal relay location, 1 by 2 matrix
    % fmin: optimal objective value, scalor
    % k: number of iterations
% Script description:
    % calls the built in fminsearch function which uses the Nelder-Mead Simplex Method (see link below)
        % https://au.mathworks.com/help/matlab/math/optimizing-nonlinear-functions.html#bsgpq6p-11
% version history:
    % JW,  2021/05/17, Created for MAST30013 Project
%% Function
function [smin, fmin, k] = NelderMeadSimplex(s0, nmbrSensors, sensorLocations)
    f = @(x)P(x, nmbrSensors, sensorLocations); % create a new objective function which is parameterised only on s0
    [smin, fmin, exitflag, output] = fminsearch(f, s0);
    k=output.funcCount; % unknown because it's a matlab built in function
end