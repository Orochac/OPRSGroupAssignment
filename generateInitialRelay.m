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
function [s0, initialRelayScenario] = generateInitialRelay(i)
    switch true
        case i == 1 % uniformaly distributed
            s0 = rand(1, 2); % x1, x2 between 0 & 1
            initialRelayScenario = {'Uniformly Distributed'};
        case (i == 2) % fixed - centre
            s0 = [0.5, 0.5]
            initialRelayScenario = {'Fixed - Centre'};
        case i == 3 % fixed - near corner
            s0 = [0.25, 0.25]
            initialRelayScenario = {'Fixed - Near Corner'};
        case i == 4 % fixed - far corner
            s0 = [0.75, 0.75]
            initialRelayScenario = {'Fixed - Far Corner'};
    end
end