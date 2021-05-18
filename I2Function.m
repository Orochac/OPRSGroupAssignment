%% Housingkeeping
% Inputs
    % s: location for the relay, 2d vector
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
    % farthestSensor: 2d vector
    % alpha: the alpha value of I2 method, scalor
% Outputs
    % smin: optimal relay location, 1 by 2 matrix
    % fmin: optimal objective value, scalor
    % k: number of iterations
% version history:
    % OR, Created for MAST30013 Project, 2021/05/16
%% I2 penalty function, 
% This is the I2 penalty method with the variable alpha
function [f] = I2Function(s, nmbrSensors, sensorLocations, farthestSensor, alpha)
    sqrdDistances = zeros(nmbrSensors, 1);
    FSdistance = Distance(s, farthestSensor)^2;
    for i=1:nmbrSensors%the initial P(s) with specified farthest sensor
        sqrdDistances(i) = Distance(s, sensorLocations(i,:))^2;
    end
    f = sum(sqrdDistances) + FSdistance;
    for i = 1:nmbrSensors %additional contraints for the I2 method
        f = f + (alpha/2)*(max(0,(sqrdDistances(i)-FSdistance))^2);
    end
end