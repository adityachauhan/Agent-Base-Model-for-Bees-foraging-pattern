function plot_results(agent,nsteps,fmode,outImages)
% Plots the results as the simulation runs

    global N_IT IT_STATS ENV_DATA MESSAGES CONTROL_DATA MIG_DATA

    nr=IT_STATS.tot_b(N_IT); % Number of agents at this iteration
    
    if (fmode==false) || (N_IT==nsteps) || ((fmode==true) && (rem(N_IT , CONTROL_DATA.fmode_display_every)==0))
        
        % Graph of statistics
        f2=figure(2);
        set(f2,'Units','Normalized');
        set(f2,'Position',[0.5 0.5 0.45 0.4]);

        subplot(5,1,1),cla
        subplot(5,1,1),plot((1:N_IT+1), IT_STATS.waggleDanceA(1:N_IT+1),'r-'); hold on
        plot((1:N_IT+1), IT_STATS.waggleDanceB(1:N_IT+1),'b-'); hold off
        legend('Source A','Source B')
        subplot(5,1,1),axis([0 nsteps 0 nr]);
        subplot(5,1,2),cla
        subplot(5,1,2), plot((1:N_IT+1), IT_STATS.atSourceA(1:N_IT+1),'r-'); hold on
        plot((1:N_IT+1), IT_STATS.atSourceB(1:N_IT+1),'b-'); hold off
        legend('Source A','Source B')
        subplot(5,1,2),axis([0 nsteps 0 nr]);
        subplot(5,1,3),cla
        subplot(5,1,3),plot((1:N_IT+1), IT_STATS.commitedA(1:N_IT+1),'r-'); hold on
        plot((1:N_IT+1), IT_STATS.commitedB(1:N_IT+1),'b-'); hold off
        legend('Source A','Source B')
        subplot(5,1,3),axis([0 nsteps 0 nr]);
        subplot(5,1,4),cla
        subplot(5,1,4),plot((1:N_IT+1), IT_STATS.recruits(1:N_IT+1),'g-');
        subplot(5,1,4),axis([0 nsteps 0 nr]);
        subplot(5,1,5),cla
        subplot(5,1,5),plot((1:N_IT+1), IT_STATS.Afood(1:N_IT+1),'r-'); hold on
        plot((1:N_IT+1), IT_STATS.Bfood(1:N_IT+1),'r-'); hold off
        subplot(5,1,5),axis([0 nsteps 0 IT_STATS.Afood(1)]);
        subplot(5,1,1),title('Number of bees doing waggle dance for Source A or B');
        subplot(5,1,2),title('Number of bees in Source A or B');
        subplot(5,1,3),title('Number of bees commited to Source A or B');
        subplot(5,1,4),title('Number of recruits');
        subplot(5,1,5),title('Amount of food in source A and B');
        drawnow

        % Figure of the environment
        f3=figure(3);

        bm=ENV_DATA.bm_size;   
        clf                             
        set(f3,'Units','Normalized');
        set(f3,'Position',[0.05 0.05 0.66 0.66]);
        v=(1:bm);
        [X,Y]=meshgrid(v);
        Z=ENV_DATA.environment;
        H=zeros(bm,bm);
        hs=surf(Y,X,H,Z);               
        cm=colormap('gray');
        icm=flipud(cm);
        colormap(icm);
        set(hs,'SpecularExponent',1);       
        set(hs,'SpecularStrength',0.1);
        hold on

        for cn=1:length(agent)                                                       
            pos=get(agent{cn},'pos');                   
            if isa(agent{cn},'bee')              
                plot(pos(1),pos(2),'r*');
            end
        end

        h=findobj(gcf,'type','surface');			
        set(h,'edgecolor','none');
        lighting flat
        h=findobj(gcf,'type','surface');
        set(h,'linewidth',0.1)
        set(h,'specularstrength',0.2)
        axis off
        axis equal
        set(gcf,'color',[1 1 1]);

        uicontrol('Style','pushbutton',...
                  'String','PAUSE',...
                  'Position',[20 20 60 20], ...
                  'Callback', 'global ENV_DATA; ENV_DATA.pause=true; display(ENV_DATA.pause); clear ENV_DATA;'); 

        while CONTROL_DATA.pause==true    
            pan on
            axis off
            title(['Iteration no.= ' num2str(N_IT) '.  No. agents = ' num2str(nr)]);
            text(-2.6, 7.7, 'PAUSED', 'Color', 'r');
            drawnow
            uicontrol('Style','pushbutton',...
                      'String','ZOOM IN',...
                      'Position',[100 20 60 20],...
                      'Callback','if camva <= 1;return;else;camva(camva-1);end');
            uicontrol('Style','pushbutton',...
                      'String','ZOOM OUT',...
                      'Position',[180 20 60 20],...
                      'Callback','if camva >= 179;return;else;camva(camva+1);end');

            uicontrol('Style','pushbutton',...
                      'String','RESUME',...
                      'Position',[20 20 60 20], ...
                      'Callback', 'global ENV_DATA; ENV_DATA.pause=false; clear ENV_DATA;'); 
        end
        title(['Iteration no.= ' num2str(N_IT) '.  No. agents = ' num2str(nr)]);
        axis off
        drawnow 
        if outImages==true  
            if fmode==true 
                    disp('WARNING*** fastmode set - To output all Images for a movie, set fmode to false(fast mode turned off) ');
            end 
            filenamejpg=[sprintf('%04d',N_IT)];
            eval(['print -djpeg90 agent_plot_' filenamejpg]); 
        end
    end
end
