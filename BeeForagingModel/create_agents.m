function [agent]=create_agents(nr)
% Create the initial agents

global ENV_DATA

nrIFA=round(nr*0.01); %number of foragers at start-up for source A
nrIFB=round(nr*0.01); %number of foragers at start-up for source B
vision=5; % Vision range

% First, create all the recruit bees
for r=1:nr-(nrIFA+nrIFB)
    pos=[randi([ENV_DATA.hivePos(2,1),ENV_DATA.hivePos(2,2)]) ...
        randi([ENV_DATA.hivePos(1,1),ENV_DATA.hivePos(1,2)])]; 
    food=0;
    agent{r}=bee(food,pos,[],vision);
end
% Create all foragers for source A
for r=nr-(nrIFA+nrIFB-1):(nr-nrIFB)
   pos=[randi([ENV_DATA.hivePos(2,1),ENV_DATA.hivePos(2,2)]) ...
        randi([ENV_DATA.hivePos(1,1),ENV_DATA.hivePos(1,2)])];  
    food=0;
    agent{r}=bee(food,pos,ENV_DATA.sourceApos,vision);
end
% Create all foragers for source B
for r=nr-(nrIFB-1):nr
   pos=[randi([ENV_DATA.hivePos(2,1),ENV_DATA.hivePos(2,2)]) ...
        randi([ENV_DATA.hivePos(1,1),ENV_DATA.hivePos(1,2)])];  
    food=0;
    agent{r}=bee(food,pos,ENV_DATA.sourceBpos,vision);
end
agent=agent(randperm(numel(agent))); % Shuffle the agent list to randomise the order
