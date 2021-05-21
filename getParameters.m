%% Housingkeeping
% Script description:
    % for users & developers to define variables and assign values
% version history:
    % JW, Created for MAST30013 Project, 2021/05/15
%% User Defined Parameters
nmbrSimPerInitialRelayScenario = 10; % number of simulations per initial relay scenario
sensorQuantity = [3, 6, 12, 24, 48, 96, 192, 384];
plotFigureInd1 = false; % indicator for whether or not to plot Initial Relay And Sensor Locations; figures will be saved in folder: figuresInitialRelayAndSensorLoc
%% System parameters
% system parameters should only be modified by developers of the main procedures
nmbrInitialRelayScenario = 4; % developer must match this number with the number of cases in generateInitialRelay.m
nmbrSensorSets = 3; % developer must match this number with the number of cases in generateSensorSet.m
nmbrAlgorithms = 3; % developer must match this number with the number of algorithm cases in the mainProcedures.m
%% Calculated Parameters
nmbrRelayInitialLoc = nmbrSimPerInitialRelayScenario * nmbrInitialRelayScenario;