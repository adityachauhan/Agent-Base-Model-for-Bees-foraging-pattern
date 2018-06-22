classdef bee  
    % Class Bee: has properties food (bolean), pos (position array of two
    % elements), knownSource (matrix with position of known source), and
    % visionRange (the distance the bee can see).
    properties    
        food;
        pos;
        knownSource;
        visionRange;
    end
    methods                         
                                    
        function b=bee(varargin) 


                switch nargin          
                    case 0							
                       b.food=[];
                       b.pos=[];
                       b.knownSource=[];
                       b.visionRange=[];
                       
                    case 1             
                       if (isa(varargin{1},'bee'))		
                            b=varargin{1};
                       else
                            error('Input argument is not a bee')
                            
                       end
                    case 4               
                       b.food=varargin{1};              
                       b.pos=varargin{2};               
                       b.knownSource=varargin{3};
                       b.visionRange=varargin{4};
                               
                    otherwise
                       error('Invalid no. of input arguments')
                end
        end
    end
end
