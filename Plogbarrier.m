%% Housingkeeping
% Inputs
    % s: relay location, 1 by 2 matrix
    % alpha: Large value for log barrier, integer
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
% Outputs
    % f: 1 by n matrix of Palphas
% version history:
    % LQ, Created for MAST30013 Project, 2021/05/17
%% Function
function [f] = Plogbarrier(s, alpha, nmbrSensors, sensorLocations);
f = zeros(1,nmbrSensors);
for i = 1:nmbrSensors;
    c = zeros(1,nmbrSensors);
    for j = 1:nmbrSensors;
        c(:,j) = log(-(Distance(s,sensorLocations(j,:)) - Distance(s,sensorLocations(i,:))));
    end
    f(:,i) = P(s,nmbrSensors, sensorLocations) - 1/(alpha) * sum(c);
end