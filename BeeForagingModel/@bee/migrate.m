function [agent]=migrate(agent,sourcePos)
% Looks for food near agent and moves it to nearest location with food, if
% no food is found it moves back to the hive
global ENV_DATA

pos=agent.pos; % Position of agent                                              
range=agent.visionRange; % Observable range for angent

%Check if the agent is inside the bounderies of the environment and set the
%limits that it can move within
if ((pos(1)-range)>=sourcePos(2,1))
    xmin=pos(1)-range;
else
    xmin=sourcePos(2,1);
end
if((pos(1)+range)<=sourcePos(2,2))
    xmax=pos(1)+range;
else
    xmax=sourcePos(2,2);
end
if((pos(2)-range)>=sourcePos(1,1))
    ymin=pos(2)-range;
else
    ymin=sourcePos(1,1);
end
if((pos(2)+range)<=sourcePos(1,2))
    ymax=pos(2)+range;
else
    ymax=sourcePos(1,2);
end
 
foundFood=false; % Flag for wheter food has been found
for n=1:range
    % Check each postion within range (increasingly from current position)
    % to see if the position has food
    xplus=pos(1)+n;
    if(xplus>xmax)
        xplus=xmax;
    end
    xminus=pos(1)-n;
    if(xminus<xmin)
        xminus=xmin;
    end
    yplus=pos(2)+n;
    if(yplus>ymax)
        yplus=ymax;
    end
    yminus=pos(2)-n;
    if(yminus<ymin)
        yminus=ymin;
    end
    
    % Check if any of the position around the bee has food
    if(ENV_DATA.environment(xplus,yplus)==1)
        agent.pos=[xplus yplus]; % If new position is not empty, go to that position
        foundFood=true; % Food was found
        break;
    elseif(ENV_DATA.environment(xminus,yminus)==1)
        agent.pos=[xminus yminus];
        foundFood=true;
        break;
    elseif(ENV_DATA.environment(xplus,pos(2))==1)
        agent.pos=[xplus pos(2)];
        foundFood=true;
        break;
    elseif(ENV_DATA.environment(pos(1),yplus)==1)
        agent.pos=[pos(1) yplus];
        foundFood=true;
        break;
    elseif(ENV_DATA.environment(xminus,pos(2))==1)
        agent.pos=[xminus pos(2)];
        foundFood=true;
    elseif(ENV_DATA.environment(pos(1),yminus)==1)
        agent.pos=[pos(1) yminus];
        foundFood=true;
        break;
    end   
end
if(foundFood==false)
    % If no food was found, set known food location to zero (forgets about
    % the source) and go back to hive
    agent.knownSource=[];
    agent=migrate_back(agent);
end


