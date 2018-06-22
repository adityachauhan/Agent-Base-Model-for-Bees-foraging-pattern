function val=get(c,prop_name)
% Function for obtaining the value of an agents variables

switch prop_name
    
case 'food'
   val=c.food;
case 'pos'
    val=c.pos;
case 'speed'
     val=c.speed;
otherwise 
   error('invalid field name')
end

