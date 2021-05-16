%% Housingkeeping
% Inputs
    % s: relay location, 1 by 2 matrix
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
% Outputs
    % f: The power required from the relays location
% version history:
    % OR, Created for MAST30013 Project, 2021/05/16
%% The function of the main problem, 
% This function calcuates the required power of the relay 
% value of P(s) given the sensor locations
function [f] = P(s, nmbrSensors, sensorLocations)
    distances = zeros(nmbrSensors, 1);
    for i=1:nmbrSensors
        distances(i) = Distance(s, sensorLocations(i,:));
    end
    f = sum(distances) + max(distances);
end