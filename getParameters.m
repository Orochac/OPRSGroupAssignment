%% Housingkeeping
% Script description:
    % for users & developers to define variables and assign values
% version history:
    % JW, Created for MAST30013 Project, 2021/05/15
%% User Defined Parameters
nmbrSimPerInitialRelayScenario = 10; % number of simulations per initial relay scenario
nmbrSensorSets = 3;
nmbrAlgorithms = 3;
sensorQuantity = [3, 6, 12, 24, 48, 96, 192, 384];
%% System parameters
% system parameters should only be modified by developers of the main procedures
nmbrInitialRelayScenario = 4; % developer must match this number with the number of cases in generateInitialRelay.m
%% Calculated Parameters
nmbrRelayInitialLoc = nmbrSimPerInitialRelayScenario * nmbrInitialRelayScenario;