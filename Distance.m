%% Housingkeeping
% Inputs
    % p1: first point, 2d vector
    % p2: second point, 2d vector
% Outputs
    % distance: The power required from the relays location
% version history:
    % OR, Created for MAST30013 Project, 2021/05/16
%% Euclidian distance between two points, 
% This function calcuates the required power of the relay 
% value of P(s) given the sensor locations
function [distance] = Distance(p1, p2)
    distance = sqrt((p1(1)-p2(1))^2 + (p1(2)-p2(2))^2);
end