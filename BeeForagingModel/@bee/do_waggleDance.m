function [] = do_waggleDance(agent,n,profit)
% Function that calculates the radius of the waggle dance and sends a
% message to the bees in that radius
global MESSAGES
                                         
wRadius=round(profit/3); % Radius is dependent on profitability of source
xmin=agent.pos(1)-wRadius;
ymin=agent.pos(2)-wRadius;
xmax=agent.pos(1)+wRadius;
ymax=agent.pos(2)+wRadius;
           
for cn=1:n                                
    pos=MESSAGES.pos(cn,:); 
    % If a bee is in the radius of the waggle dance, give a message with
    % the location of the source (unless it already has a message)
    if(pos(1)>=xmin)&&(pos(1)<=xmax)&&(pos(2)>=ymin)&&(pos(2)<=ymax)&&(MESSAGES.wSourceXmin(cn)==0)
        MESSAGES.wSourceXmin(cn)=agent.knownSource(2,1);
        MESSAGES.wSourceXmax(cn)=agent.knownSource(2,2);
        MESSAGES.wSourceYmin(cn)=agent.knownSource(1,1);
        MESSAGES.wSourceYmax(cn)=agent.knownSource(1,2);
        
    end
end

end

