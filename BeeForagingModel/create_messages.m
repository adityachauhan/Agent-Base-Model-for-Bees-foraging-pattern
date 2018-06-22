function create_messages(agent)
% Function for creating messages between agents
  
 global MESSAGES ENV_DATA IT_STATS
 % Counter for how many bees are commited to source A or B
sA=0; 
sB=0;
recruits=0; % Counter for number of recruits
 for an=1:length(agent)
        MESSAGES.pos(an,:)=get(agent{an},'pos'); % Location of agent
        % Sources that have been percieved through waggle dance:
        MESSAGES.wSourceXmin(an)=0;
        MESSAGES.wSourceXmax(an)=0;
        MESSAGES.wSourceYmin(an)=0;
        MESSAGES.wSourceYmax(an)=0;
        % Check how many agents are recruits (doesn't know of a source)
        if(isequal(agent{an}.knownSource,ENV_DATA.sourceApos))
            sA=sA+1;
        elseif(isequal(agent{an}.knownSource,ENV_DATA.sourceBpos))
            sB=sB+1;
        else
            recruits=recruits+1;
        end
      
 end
 IT_STATS.recruits(1)=recruits; % Store initial number of recruits in global varible
