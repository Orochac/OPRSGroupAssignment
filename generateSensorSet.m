%% Housingkeeping
% Inputs
    % sensorQuantity: number of sensors needs to be generated, vector
    % j: sensor set#, scalar
% Outputs
    % sensorSet: [sensor#, x1, x2], vector
    % sensorScenario: describes the distribution of sensor locations, scalar
% Script description:
    % 
% version history:
    % JW,  2021/05/18, Created for MAST30013 Project
%% Function
function [sensorSet, sensorScenario] = generateSensorSet(sensorQuantity, j)
    switch j
        case 1 % randomly distributed
            sensorLocations = rand(max(sensorQuantity),2);
            sensorSet = [transpose(1:max(sensorQuantity)), sensorLocations];
            sensorScenario = {'Evenly Distributed'};
        case 2 % clsutered - corner
            sensorLocations = abs(randn(max(sensorQuantity),2)); % abs(x1), abs(x2)
            maxLocations = max(sensorLocations);
            sensorLocations = sensorLocations ./ maxLocations; % normalised x1, x2 to be between 0 and 1
            sensorSet = [transpose(1:max(sensorQuantity)),sensorLocations];
            sensorScenario = {'Clsutered - Corner'};
        case 3 % clustered - centre
            sensorLocations = randn(max(sensorQuantity),2);
            maxLocations = max(sensorLocations);
            minLocations = min(sensorLocations);
            for i = 1:length(sensorLocations); % normalise x1, x2
                if sensorLocations(i,1)>0 % x1
                   sensorLocations(i,1) = sensorLocations(i,1) / maxLocations(1,1);
                else
                   sensorLocations(i,1) = sensorLocations(i,1) / abs(minLocations(1,1));
                end
                if sensorLocations(i,2)>0 % x2
                   sensorLocations(i,2) = sensorLocations(i,2) / maxLocations(1,2);
                else
                   sensorLocations(i,2) = sensorLocations(i,2) / abs(minLocations(1,2));
                end
            end
            sensorLocations = sensorLocations / 2; % compress x1, x2 to be between -0.5 & 0.5
            sensorLocations = sensorLocations + 0.5; % shift x1, x2 to be between 0 & 1
            sensorSet = [transpose(1:max(sensorQuantity)),sensorLocations];
            sensorScenario = {'Clsutered - Centre'};
    end
    % scatter(sensorLocations(:,1), sensorLocations(:,2)) % visualise sensor locations
end