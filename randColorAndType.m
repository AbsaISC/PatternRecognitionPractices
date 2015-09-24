function resFinal = randColorAndType( )
           % b     blue          .     point              -     solid
           % g     green         o     circle             :     dotted
           % r     red           x     x-mark             -.    dashdot 
           % c     cyan          +     plus               --    dashed   
           % m     magenta       *     star             (none)  no line
           % y     yellow        s     square
           % k     black         d     diamond
           % w     white         v     triangle (down)
           %                     ^     triangle (up)
           %                     <     triangle (left)
           %                     >     triangle (right)
           %                     p     pentagram
           %                     h     hexagram
%rng(0,'twister');
color = randi([1 7],1,1);
switch color
  case 1
    res='b';
  case 2
    res='g';
  case 3
    res='r'; 
  case 4
    res='c';
  case 5
    res='m';
  case 6
    res='y'; 
  case 7
    res='k';
  % case 8
  %   res='w'; 
end

symbol = randi([1 11],1,1);
switch symbol
  case 1
    res2='.';
  case 2
    res2='o';
  case 3
    res2='x'; 
  case 4
    res2='+';
  case 5
    res2='*';
  case 6
    res2='s'; 
  case 7
    res2='d';
  case 8
    res2='v'; 
  case 9
    res2='^';
  case 10
    res2='<';
  case 11
    res2='>'; 
  % case 12
  %   res2='p';
  % case 13
  %   res2='h';
  % case 14
  %   res2='-'; 
  % case 15
  %   res2=':';
  % case 16
  %   res2='-.'; 
  % case 17
  %   res2='--'; 
end

resFinal=strcat(res,res2);
return ;
end

