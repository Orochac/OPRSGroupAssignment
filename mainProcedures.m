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
    [s0, initialRelayScenario] = generateInitialRelay(i)
    for j = 1:nmbrSensorSets
		[sensorSet, sensorScenario] = generateSensorSet(sensorQuantity, j);
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
                        nameAlgorithm = {'Monte Carlo'};
                    case 2 % Algorithm 2
                        [smin, fmin, k] = singleGuess(s0, nmbrSensors, sensorLocations);
                        nameAlgorithm = {'Single Guess'};
                    case 3 % Algorithm 3
                        [smin, fmin, k] = NelderMeadSimplex(s0, nmbrSensors, sensorLocations);
                        nameAlgorithm = {'Nelder-Mead Simplex'};
					case 4 % Algorithm 4
                        [smin, fmin, k] = sampleAlgorithm(s0, nmbrSensors, sensorLocations);
                        nameAlgorithm = {'Place Holder'};
                    case 5 % Algorithm 5
                        [smin, fmin, k] = sampleAlgorithm(s0, nmbrSensors, sensorLocations);
                        nameAlgorithm = {'Place Holder'};
                end
                timeElapsed1 = toc(timerStart1)*1000; % unit: millisecond
                % Store results
                s0Str = convertCoordntToStr(s0);
                sminStr = convertCoordntToStr(smin);
                resultTemp = table(s0Str, sensorScenario, nmbrSensors, nameAlgorithm, sminStr, fmin, k, timeElapsed1); %table for storing results
                resultSummary = [resultSummary; resultTemp];
            end
        end
    end
end
resultSummary.Properties.VariableNames = {'RelayInitialLocation', 'sensorScenario', 'NmbrofSensors', 'Algorithm', 'smin', 'fmin', 'NmbrofFcal', 'RunTime'}
%% Export results to csv file
writetable(resultSummary, 'resultSummary.txt', 'Delimiter', ',')