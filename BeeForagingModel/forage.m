function forage(size,nr,nsteps,sizeSourceA,sizeSourceB,distA, distB,fmode,outImages)
    % Clear all global variables and close all figures
    clear global; close all;

    % Parameters: size of environment, number of bees, number of
    % iterations, size of source A in percentage, size of source B in
    % percentage (must be 'oposite' of A, e.g. if A is 0.25, B must be
    % 0.75), fmode and outImages are optional
    
    global N_IT IT_STATS ENV_DATA

    if nargin == 7
         % If number of argument is 7 set fmode and outImages to default
        fmode=true;
        outImages=false;
    elseif nargin ==8
        % If number of argument is 8 set outImages to default
        outImages=false;
    end
   
    create_control; % Create control variables                                       
    create_environment(size,sizeSourceA,sizeSourceB,distA,distB); % Create anvironment variables, 
    % parameters: size of environment, size of source A and B (as a percentage of the environment),
    % and distance to source A and B (not showed graphically, just a
    % number)    
    [agent]=create_agents(nr);% Create agents         
    initialise_results(nr,nsteps); % Initiales result varibles, parameters: number of beed and iteration steps 
    create_messages(agent); % Create global messages for the agents
    
    % For each iteration, update agent and plot results
    for n_it=1:nsteps                   
        N_IT=n_it; % Current iteration number
        [agent]=agnt_solve(agent); % Updates the agents    
        plot_results(agent,nsteps,fmode,outImages); % Plots the results

    end
% Save the results of the current simulation
eval(['save results_nr_' num2str(nr)  '.mat IT_STATS ENV_DATA' ]);

clear global % Clear global variables
