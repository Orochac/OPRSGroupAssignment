%% Housingkeeping
% Inputs
    % i: initial relay scenario #, scalar
% Outputs
    % s0: initial relay location, vector
    % initialRelayScenario: describes the distribution of initial relay, scalar
% Script description:
    % 
% version history:
    % JW,  2021/05/19, Created for MAST30013 Project
%% Function
function [s0, initialRelayScenario] = generateInitialRelay(i, nmbrRelayInitialLoc)
    nmbrRelayPerScenario = nmbrRelayInitialLoc / 4;
    switch true
        case and(i >= 0*nmbrRelayPerScenario + 1, i <= 1*nmbrRelayPerScenario) % uniformaly distributed
            s0 = rand(1, 2); % x1, x2 between 0 & 1
            initialRelayScenario = {'Uniformly Distributed'};
        case and(i >= 1*nmbrRelayPerScenario + 1, i <= 2*nmbrRelayPerScenario) % fixed - centre
            s0 = [0.5, 0.5];
            initialRelayScenario = {'Fixed - Centre'};
        case and(i >= 2*nmbrRelayPerScenario + 1, i <= 3*nmbrRelayPerScenario) % fixed - near corner
            s0 = [0.25, 0.25];
            initialRelayScenario = {'Fixed - Near Corner'};
        case and(i >= 3*nmbrRelayPerScenario + 1, i <= 4*nmbrRelayPerScenario) % fixed - far corner
            s0 = [0.75, 0.75];
            initialRelayScenario = {'Fixed - Far Corner'};
    end
end