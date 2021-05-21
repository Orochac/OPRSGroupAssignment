%% Housingkeeping
% Inputs
    % s: location for the relay, 2d vector
    % nmbrSensors: number of sensors, scalor
    % sensorLocations: sensor locations, m by 2 matrix
    % farthestSensor: 2d vector
    % alpha: the alpha value of LB method, scalor
% Outputs
    % f: output 2d vector
% version history:
    % LQ, Created for MAST30013 Project, 2021/05/21
%% LB grad function, 
% This is the grad of the LB penalty method with the variable alpha
function [f] = LBGrad(s, nmbrSensors, sensorLocations, farthestSensor, alpha)
    f1 = 0;
    f2 = 0;
    for i=1:nmbrSensors%the initial gradP(s) with specified farthest sensor
        f1 = f1 + 2*(s(1)-sensorLocations(i,1));
        f2 = f2 + 2*(s(2)-sensorLocations(i,2));
    end
    f1 = f1 + 2*(s(1)-farthestSensor(1));
    f2 = f2 + 2*(s(2)-farthestSensor(2));
    for i = 1:nmbrSensors %additional contraints for the LB method
        g = Distance(s, sensorLocations(i,:))^2 - Distance(s, farthestSensor)^2;
        gradg1 = 2*(s(1)*(farthestSensor(1)-sensorLocations(i,1)));
        f1 = f1 - (1/(alpha*g))*gradg1;
        gradg2 = 2*(s(2)*(farthestSensor(2)-sensorLocations(i,2)));
        f2 = f2 - (1/(alpha*g))*gradg2;
    end
    f = [f1; f2];
end