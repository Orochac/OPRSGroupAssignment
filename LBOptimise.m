%% Housingkeeping
% Inputs
    % s0: location for the relay, 2d vector
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
% This is a minimiser of LB using the BFGS method
function [smin, fmin, k] = LBOptimise(s0, nmbrSensors, sensorLocations, farthestSensor, alpha)
    epsilon = 0.1; %precision of the optimisation
    k=0;
    H = eye(2);
    s = s0;
    while norm(LBGrad(s, nmbrSensors, sensorLocations, farthestSensor, alpha))>= epsilon
        d = -H*LBGrad(s, nmbrSensors, sensorLocations, farthestSensor, alpha);
        t = LBStepMin(s, d, nmbrSensors, sensorLocations, farthestSensor, alpha);
        s1 = transpose(s)+t*d;
        sk = s1-transpose(s);
        gk = LBGrad(s1, nmbrSensors, sensorLocations, farthestSensor, alpha) - LBGrad(s, nmbrSensors, sensorLocations, farthestSensor, alpha);
        rk = H*gk/dot(sk,gk);
        H = H + ((1+dot(rk,gk))/dot(sk,gk))*sk*transpose(sk)-(sk*transpose(rk)+rk*transpose(sk));
        s = transpose(s1);
    end
    smin = s;
    fmin = P(s, nmbrSensors, sensorLocations);
end