function create_environment(size,sizeA,sizeB,distA,distB)
% Function that sets up the environment

global ENV_DATA

ENV_DATA.shape='square';
ENV_DATA.units='metres';
ENV_DATA.bm_size=size; % Environment size
ENV_DATA.environment=zeros(size,size); % Initialise the environment as a matrix of zeros    
ENV_DATA.environment(1:end,1:round(size*sizeA))=1; % Food source A area (1 means food)
ENV_DATA.environment(1:end,round(size*sizeB):end-1)=1; % Food source B area (1 means food)
ENV_DATA.environment(round(size*0.45):round(size*0.55),round(size*0.45):round(size*0.55))=-1; %Hive area (-1 indicates hive)
% Position of the sources and the hive given as x and y coordinates 
ENV_DATA.sourceApos=[ 1 round(size*sizeA);1 size]; % Position of source A 
ENV_DATA.sourceBpos=[ round(size*sizeB) size-1;1 size]; % Position of source B
ENV_DATA.hivePos=[round(size*0.45) round(size*0.55);round(size*0.45) round(size*0.55)]; % Position of hive
% Position of sources/hive is structured in matrix:
% |ymin ymax|
% |xmin xmax|
ENV_DATA.hiveSize=round(size*0.55)-round(size*0.45); % Size of hive
ENV_DATA.distanceA=distA;% Distance to A from hive, preset
ENV_DATA.distanceB=distB; % Distance from B to hive, prest
% If not using preset values, the following variables can be used:
% ENV_DATA.distanceA=ENV_DATA.hivePos(1,1)-ENV_DATA.sourceApos(1,2);% Distance to A from hive
% ENV_DATA.distanceB=ENV_DATA.sourceBpos(1,1)-ENV_DATA.hivePos(1,2); % Distance from B to hive


