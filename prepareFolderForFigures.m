%% Housingkeeping
% Script description:
    % prepare folder for storing figures created in the program
% version history:
    % JW,  2021/05/20, Created for MAST30013 Project
%% Prepare folder
% specify the folder for storing figures
figFolderName = 'figuresInitialRelayAndSensorLoc';

if ~exist(figFolderName, 'dir')
   % create folder, if it didn't exist
   mkdir(figFolderName);
end

% delete all .jpg files in this folder
delete(fullfile(pwd, figFolderName, '*.jpg'));