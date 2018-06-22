function [agent]=migrate_back(agent)
% Agents moves back to hive

global ENV_DATA 

% Set new location to a random position within hive
agent.pos=[randi([ENV_DATA.hivePos(2,1),ENV_DATA.hivePos(2,2)]) ...
    randi([ENV_DATA.hivePos(1,1),ENV_DATA.hivePos(1,2)])];
agent.food=0; % Unload the food

