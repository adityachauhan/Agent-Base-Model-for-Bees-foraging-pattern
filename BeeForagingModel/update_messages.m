function [agent]=update_messages(agent,n)
% Update all messages

global MESSAGES IT_STATS N_IT ENV_DATA
% Counter for how many bees are commited to source A or B
sA=0; 
sB=0;
recruits=0; % Counter for how many recruits there are
for cn=1:n                                
    pos=get(agent{cn},'pos'); % Get position of agent
    MESSAGES.pos(cn,:)=pos; % Update the message with new position of agent
    % Counts the number of recruits, and the number of foragers commited to each source
    if(isequal(agent{cn}.knownSource,ENV_DATA.sourceApos))
        sA=sA+1;
    elseif(isequal(agent{cn}.knownSource,ENV_DATA.sourceBpos))
        sB=sB+1;
    else
        recruits=recruits+1;
    end
end
% Find the current amount of food in each source and store it in the
% statistics arrays
IT_STATS.Afood(N_IT+1)=length(find(ENV_DATA.environment(ENV_DATA.sourceApos(1,1):ENV_DATA.sourceApos(1,2),...
 ENV_DATA.sourceApos(2,1):ENV_DATA.sourceApos(2,2))==1));
IT_STATS.Bfood(N_IT+1)=length(find(ENV_DATA.environment(ENV_DATA.sourceBpos(1,1):ENV_DATA.sourceBpos(1,2),...
 ENV_DATA.sourceBpos(2,1):ENV_DATA.sourceBpos(2,2))==1));
% Find the current amount of food in total for the whole environment
IT_STATS.tfood(N_IT+1)=length(find(ENV_DATA.environment==1));  

IT_STATS.tot_b(N_IT+1)=n; % Total number of bees
 
 IT_STATS.commitedA(N_IT+1)=sA; % Number of foragers commited to source A
 IT_STATS.commitedB(N_IT+1)=sB; % Number of foragers commited to source B
 IT_STATS.recruits(N_IT+1)=recruits; % Number of recruits