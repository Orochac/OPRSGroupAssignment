%% Housekeeping
% Script description:
    % plot initial relay and sensor locations
% version history:
    % JW, Created for MAST30013 Project, 2021/05/15
%% Find sensor locations to be plotted
% always find full set of sensors of a sensor scenario
% i.e. the number of sensors found always equal to the largest number in the snesorQuantity vector
nmbrSensors = sensorQuantity(1,length(sensorQuantity));
sensorLocations = sensorSet(1:nmbrSensors, 2:3);
%% Plot initial relay location and sensor locations
scatter(s0(:,1), s0(:,2), [], 'blue','filled', 's');
hold on;
scatter(sensorLocations(:,1), sensorLocations(:,2), 10, 'green', 'o');
hold off;
set(gca, 'xtick', [], 'ytick', [], 'XColor', 'none', 'YColor', 'none');
%% Save figures
fileName = strcat('initialRelayLocation', string(i), 'sensorScenario', string(j));
saveas(gcf, fullfile(pwd, figFolderName, fileName), 'jpeg');

