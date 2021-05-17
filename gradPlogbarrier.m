%% Housingkeeping
% Inputs
    % s: relay location, 1 by 2 matrix
    % alpha: Large value for log barrier, integer
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
% Outputs
    % f: 2 by n matrix, gradient of Palpha for log barrier on each column
% version history:
    % LQ, Created for MAST30013 Project, 2021/05/17
%% Function
function [f] = gradPlogbarrier(s, alpha, nmbrSensors, sensorLocations);
f = zeros(2,nmbrSensors); %Vector 
for i = 1:nmbrSensors;
    c = zeros(2,nmbrSensors);
    for j = 1:nmbrSensors;
        c(1,j) = 2*s(1) - 2*sensorLocations(j,1) -1/(alpha*(Distance(s,sensorLocations(j,:)) - Distance(s,sensorLocations(i,:)))) * (sensorLocations(j,1) - sensorLocations(i,1));
        c(2,j) = 2*s(2) - 2*sensorLocations(j,2) -1/(alpha*(Distance(s,sensorLocations(j,:)) - Distance(s,sensorLocations(i,:)))) * (sensorLocations(j,2) - sensorLocations(i,2));
    end
    f(1,i) = sum(c(1,:)) + 2*s(1) - 2* sensorLocations(i,1);
    f(2,i) = sum(c(2,:)) + 2*s(1) - 2* sensorLocations(i,1);
end