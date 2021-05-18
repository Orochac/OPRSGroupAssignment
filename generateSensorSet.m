%% Housingkeeping
% Inputs
    % sensorQuantity: number of sensors needs to be generated, vector
    % j: sensor set#, scaler
% Outputs
    % sensorSet: [sensor#, x1, x2], vector
% Script description:
    % 
% version history:
    % JW,  2021/05/18, Created for MAST30013 Project
%% Function
function [sensorSet] = generateSensorSet(sensorQuantity, j)
    switch j
        case 1 % randomly distributed
            sensorLocations = rand(max(sensorQuantity),2);
            sensorSet = [transpose(1:max(sensorQuantity)), sensorLocations];
        case 2 % clsutered - corner
            sensorLocations = abs(randn(max(sensorQuantity),2)); % abs(x1), abs(x2)
            maxLocations = max(sensorLocations);
            sensorLocations = sensorLocations ./ maxLocations; % normalised x1, x2 to be between 0 and 1
            sensorSet = [transpose(1:max(sensorQuantity)),sensorLocations];
    end
    % scatter(sensorLocations(:,1), sensorLocations(:,2)) % visualise sensor locations
end