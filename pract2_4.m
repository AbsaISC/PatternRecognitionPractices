clc
close all
clear all
warning off all

img=imread('atardecer.jpg');
imgsize=size(img);%1 es num de filas y 2 num de columnas
prompt = {'Introduce número de Muestras:'};
dlg_title = 'Inicio';
num_lines = 1;
defaultans = {'10'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if isempty (answer)
    return
end
numMuestras=str2double(answer(1,1));
imshow(img);
hold on
i=1;
Xs=[];
Ys=[];
while i <= numMuestras
    [x,y]=ginput(1);
    plot(x,y,'r.')
    if x>1 && y>1 && x< imgsize(2) && y< imgsize(1)
        if(i==1)
            Xs=x;
            Ys=y;
        else
            Xs=[Xs ; x];
            Ys=[Ys ; y];
        end
        i=i+1;
    end
end
cordenadas=[Xs Ys];
cordenadas=cordenadas';
cordenadas
round(cordenadas)
prompt = {'Introduce número de Clases:'};
dlg_title = 'Inicio';
num_lines = 1;
defaultans = {'3'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if isempty (answer)
    return
end
numClases=str2double(answer(1,1));
centros=[];
centrosAnt=[];
for h=1:numClases
    centros(:,h)=cordenadas(:,h);
    centrosAnt(:,h)=[0;0];
end


grupos(2,:,numClases)=zeros;
numGrup=0;
limit=1;
symbol=[];
color=[];
while ~isequal(centros,centrosAnt)
    for co=1:size(cordenadas,2)
        dist=-1;
        for ca=1:size(centros,2)
            distancia=norm(cordenadas(:,co)-centros(:,ca));
            if(dist==-1)
                dist=distancia;
                numGrup=ca;
            else
                if dist>distancia
                    numGrup=ca;
                    dist=distancia;
                end
            end
        end
        grupos(:,co,numGrup)=cordenadas(:,co);
    end
     figure(limit)
     imshow(img);
     hold on
     plot(cordenadas(1,:),cordenadas(2,:),'r.')
     for plus=1:size(centros,2)
        [vcol symbol color]=randColorAndType(symbol , color);
        plot(centros(1,plus),centros(2,plus),vcol,'MarkerSize',10,'LineWidth',3);
        plot(grupos(1,:,plus),grupos(2,:,plus),[vcol(1),'o'],'MarkerSize',5,'LineWidth',2);
     end
    centrosAnt=centros;
    centros=getMeansWithoutZeros(grupos);
    
    if limit>=1000
        disp('romper')
        break;
    end
    grupos
    limit=limit+1;
   grupos(:,:,:)=zeros;
    % grupos(2,:,numClases)=zeros;
end

grupos

