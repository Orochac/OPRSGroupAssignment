%% Housekeeping
% Script description:
    % 
% version history:
    % JW, Created for MAST30013 Project, 2021/05/15
%% Prepare environment
clear
%% Get parameters
getParameters;
%% Generate instances, run algorithms and stores results
resultSummary = table; % create empty table for storing results
for i=1:nmbrRelayInitialLoc
    s0 = rand(1, 2); % random start location from (0,0) to (1,1)
    for j = 1:nmbrSensorSets
        sensorSet = [transpose(1:max(sensorQuantity)),rand(max(sensorQuantity),2)];
        for k=1:length(sensorQuantity)
            s0;
            nmbrSensors = sensorQuantity(1,k);
            sensorLocations = sensorSet(1:nmbrSensors, 2:3);
            for l=1:nmbrAlgorithms;
                % Run algorithm here
                timerStart1 = tic;
                switch l
                    case 1 % Algorithm 1
                        [smin, fmin, k] = montecarlo(s0, nmbrSensors, sensorLocations);
                        nameAlgorithm = {'Algorithm#1'};
                    case 2 % Algorithm 2
                        [smin, fmin, k] = singleGuess(s0, nmbrSensors, sensorLocations);
                        nameAlgorithm = {'Nelder-Mead Simplex'};
                    case 3 % Algorithm 3
                        [smin, fmin, k] = sampleAlgorithm(s0, nmbrSensors, sensorLocations);
                        nameAlgorithm = {'Algorithm#3'};
                end
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
resultSummary.Properties.VariableNames = {'RelayInitialLocation', 'SensorSetNmbr', 'NmbrofSensors', 'Algorithm', 'smin', 'fmin', 'NmbrofIterations', 'RunTime'}