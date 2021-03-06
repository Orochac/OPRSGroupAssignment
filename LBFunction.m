%% Housingkeeping
% Inputs
    % s: location for the relay, 2d vector
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
    % farthestSensor: 2d vector
    % alpha: the alpha value of LB method, scalor
% Outputs
    % smin: optimal relay location, 1 by 2 matrix
    % fmin: optimal objective value, scalor
    % k: number of iterations
% version history:
    % LQ, Created for MAST30013 Project, 2021/05/21
%% LB penalty function, 
% This is the LB penalty method with the variable alpha
function [f] = LBFunction(s, nmbrSensors, sensorLocations, farthestSensor, alpha)
    sqrdDistances = zeros(nmbrSensors, 1);
    FSdistance = Distance(s, farthestSensor)^2;
    for i=1:nmbrSensors%the initial P(s) with specified farthest sensor
        sqrdDistances(i) = Distance(s, sensorLocations(i,:))^2;
    end
    f = sum(sqrdDistances) + FSdistance;
    for i = 1:nmbrSensors %additional contraints for the LB method
        if sqrdDistances(i)-FSdistance == 0
            continue
        end
        f = f - (1/alpha)*(log(-((sqrdDistances(i)-FSdistance)^2)));
    end
end