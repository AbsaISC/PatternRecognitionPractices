function [resFinal colors symbols] = randColorAndType(colors, symbols)
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
if(isempty(colors))
  colors=[ 'b', 'g','c','m','y','k'];
end
tamc=size(colors,2);
color = randi([1 tamc],1,1);

if(isempty(symbols))
  symbols=['.', 'o', 'x', '+', '*', 's', 'd', 'v','^', '<', '>'];
end
tams=size(symbols,2);
symbol = randi([1 tams],1,1);

unox=colors(color);
dosx=symbols(symbol);
colors(color)=[];
symbols(symbol)=[];
resFinal=strcat(unox,dosx);
return ;
end

