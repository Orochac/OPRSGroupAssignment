%% Housingkeeping
% Inputs
    % s0: location for the relay, 2d vector
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
% This is a minimiser of I2 using the BFGS method
function [smin, fmin, k] = I2Optimise(s0, nmbrSensors, sensorLocations, farthestSensor, alpha)
    epsilon = 0.01; %precision of the optimisation
    k=0;
    H = eye(2);
    s = s0;
    while norm(I2Grad(s, nmbrSensors, sensorLocations, farthestSensor, alpha))>= epsilon
        d = -H*I2Grad(s, nmbrSensors, sensorLocations, farthestSensor, alpha);
        t = I2StepMin(s, d, nmbrSensors, sensorLocations, farthestSensor, alpha);
        s1 = transpose(s)+t*d;
        sk = s1-transpose(s);
        gk = I2Grad(s1, nmbrSensors, sensorLocations, farthestSensor, alpha) - I2Grad(s, nmbrSensors, sensorLocations, farthestSensor, alpha);
        rk = H*gk/dot(sk,gk);
        H = H + ((1+dot(rk,gk))/dot(sk,gk))*sk*transpose(sk)-(sk*transpose(rk)+rk*transpose(sk));
        s = transpose(s1);
    end
    smin = s;
    fmin = P(s, nmbrSensors, sensorLocations);
end