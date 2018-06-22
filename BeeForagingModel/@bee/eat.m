function [agent,eaten]=eat(agent)
% Function for collecting food
global  ENV_DATA 

pos=agent.pos; % Position of agent                         
cfood=agent.food;  % Food level of agent                                              
pfood=ENV_DATA.environment(pos(1),pos(2)); % Food level at current position

if pfood==1  % If the bee is position within a source that contains food                           
    ENV_DATA.environment(pos(1),pos(2))=0; % Remove food from location
    agent.food=cfood+1;  % eat food                  
    eaten=1;
elseif pfood<=0 % If the bee is somewhere with no food
    eaten=0;                          
end
    
   
