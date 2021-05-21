%% Housingkeeping
% Inputs
    % s0: starting location for the relay, 2d vector
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
% Outputs
    % smin: optimal relay location, 1 by 2 matrix
    % fmin: optimal objective value, scalor
    % k: number of iterations
% version history:
    % LQ, Created for MAST30013 Project, 2021/05/21
%% LB penalty function, 
% This is the LB penalty method with the variable alpha
function [smin, fmin, k] = LB(s0, nmbrSensors, sensorLocations)
    alpha = 100;%alpha value
    k =0;
    %good = 0;
    valid = convhull(sensorLocations(:,1),sensorLocations(:,2));%find valid cases
    fscores = zeros(size(valid,1), 1);%create vector of each result
    slocations = zeros(size(valid,1), 2);%create matrix of relay locations
    for i = 1:size(valid,1) %need to minimise each of the cases
        farthestSensor = sensorLocations(valid(i),:);
        [temp, fscores(i), itter] = LBSteepDesc(s0, nmbrSensors, sensorLocations, farthestSensor, alpha);%need temp
        k = k+itter;
        if 0<=temp(1)&&temp(1)<=1 &&0<=temp(2)&&temp(2)<=1
            %good = good + 1;
            slocations(i,:) = temp;
        else
            slocations(i,:) = s0;
        end
    end
    %good
    %slocations
    [fmin, I] = min(fscores);
    smin = slocations(I,:);
end