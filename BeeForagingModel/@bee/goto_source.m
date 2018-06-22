function [agent] = goto_source(agent)
% Updates the position of the bee to somewhere random within its known
% source
global ENV_DATA 

if(isequal(agent.knownSource,ENV_DATA.sourceApos))
    agent.pos=[randi([ENV_DATA.sourceApos(2,1),ENV_DATA.sourceApos(2,2)]) ...
    randi([ENV_DATA.sourceApos(1,1),ENV_DATA.sourceApos(1,2)])];
elseif(isequal(agent.knownSource,ENV_DATA.sourceBpos))
    agent.pos=[randi([ENV_DATA.sourceBpos(2,1),ENV_DATA.sourceBpos(2,2)]) ...
    randi([ENV_DATA.sourceBpos(1,1),ENV_DATA.sourceBpos(1,2)])];
end

end

