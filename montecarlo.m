%% Housingkeeping
% Inputs
    % s0: can be ignored in this algorithm
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
% Outputs
    % smin: optimal relay location, 1 by 2 matrix
    % fmin: optimal objective value, scalor
    % k: number of iterations
% version history:
    % OR, Created for MAST30013 Project, 2021/05/16
%% Monte carlo simulation, 
% this will be the baseline for the project, essentially we guess a whole
% bunch of relay locations and pick the best one. I guess iterations = k
function [smin, fmin, k] = montecarlo(s0, nmbrSensors, sensorLocations)
    simulationIterrations = 1000;%number of simulations
    fscores = zeros(nmbrSensors, 1);%create vector of simulation results
    slocations = rand(nmbrSensors, 2);%create matrix of relay locations
    for i = 1:simulationIterrations
        fscores(i) = P(slocations, nmbrSensors, sensorLocations);
    end
    k = simulationIterrations;
    [fmin, I] = min(fscores);
    smin = slocations(I,:);
end