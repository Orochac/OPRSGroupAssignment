%% Housekeeping
% Script description:
    % small scale test
% version history:
    % OR, Created for MAST30013 Project, 2021/05/15
%% Prepare environment
clear
%% Get parameters
nmbrRelayInitialLoc = 1;
nmbrSensorSets = 1;
nmbrAlgorithms = 1;
sensorLength = 8;
sensorQuantity = [3, 6, 12, 24, 48, 96, 192, 384];
%% Generate instances, run algorithms and stores results
resultSummary = table; % create empty table for storing results
for i=1:nmbrRelayInitialLoc
    s0 = rand(1, 2); % random start location from (0,0) to (1,1)
    for j = 1:nmbrSensorSets
        sensorSet = [transpose(1:max(sensorQuantity)),rand(max(sensorQuantity),2)];
        for k=1:sensorLength
            s0;
            nmbrSensors = sensorQuantity(1,k);
            sensorLocations = sensorSet(1:nmbrSensors, 2:3);
            for l=1:nmbrAlgorithms;
                % Run algorithm here
                timerStart1 = tic;
                [smin, fmin, k] = LB(s0, nmbrSensors, sensorLocations);
                nameAlgorithm = {'LB'};
                timeElapsed1 = toc(timerStart1)*1000; % unit: millisecond
                % Store results
                s0Str = convertCoordntToStr(s0);
                sminStr = convertCoordntToStr(smin);
                resultTemp = table(s0Str, j, nmbrSensors, nameAlgorithm, sminStr, fmin, k, timeElapsed1); %table for storing results
                resultSummary = [resultSummary; resultTemp];
            end
        end
    end
end
resultSummary.Properties.VariableNames = {'RelayInitialLocation', 'SensorSetNmbr', 'NmbrofSensors', 'Algorithm', 'smin', 'fmin', 'NmbrofFcal', 'RunTime'}
%% Export results to csv file
writetable(resultSummary, 'resultSummary.txt', 'Delimiter', ',')