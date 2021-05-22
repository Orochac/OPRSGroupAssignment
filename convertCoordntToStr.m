%% Housingkeeping
% Inputs
    % x: coordinate in matrix form, 1 by 2 matrix
% Outputs
    % str: coordinate in string form, (x1, x2)
% version history:
    % JW, Created for MAST30013 Project, 2021/05/15
%% Function
function str = convertCoordntToStr(x)
    str = string(round(x, 7));
    str = strcat('(', str(:,1), ',', str(:,2), ')');
end