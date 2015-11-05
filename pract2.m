clc
close all
clear all
warning off all

img=imread('peppers.png');
imgsize=size(img);%1 es num de filas y 2 num de columnas

% Se pide el numero de clases y cantidad de individuos
prompt = {'Introduce número de clases:','Escribe número de representantes:'};
dlg_title = 'Inicio';
num_lines = 1;
defaultans = {'3','10'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if isempty (answer)
    return
end
numClass=str2double(answer(1,1));
numRep=str2double(answer(2,1));

% ciclo que pide las dispersiones de cada clase y la ubicación del pixel
classes=[];
i=1;
while i <= numClass
	prompt = {['Introduce la dispersion de la clase #',num2str(i)]};
	dlg_title = 'Dispersión';
	num_lines = 1;
    defaultans = {'3'};
	cordDisp= inputdlg(prompt,dlg_title,num_lines,defaultans);
    disper=str2num(cordDisp{1,:});
    imshow(img);
    [x,y]=ginput(1);
    close all;
    if x>1 && y>1 && x< imgsize(2) && y< imgsize(1)
        % disp(['esto es x=',num2str(x)]);
        % disp(['esto es y=',num2str(y)]);
        % disp(['disper =',num2str(disper)]);
        % disp(['numclass =',num2str(i)]);
        % disp('******');
        group1=randn(1,numRep)*disper+x;
        group2=randn(1,numRep)*disper+y;
        group1(group1<1)=1;
        group2(group2<1)=1;
        group1(group1>imgsize(2))=imgsize(2);
        group2(group2>imgsize(1))=imgsize(1);
        classes(1,:,i)=group1;
        classes(2,:,i)=group2;
        i=i+1;
    end
end
% disp(classes);

% Se pide el vector a clasificar.
imshow(img);
uiwait(msgbox({'Introduzca el pixel que se clasificará'} ,'Click en pixel','modal'));
[x,y]=ginput(1);
pixel=impixel(img,x,y);
% Se obtienen los pixeles de cada clase 
pixelsXclass=[];
for clase=1:size(classes,3)
    claseX=impixel(img,classes(1,:,clase),classes(2,:,clase));
    pixelsXclass(:,:,clase)=claseX';
end

% Se grafican los puntos en la imagen
imshow(img);
hold on
symbol=[];
color=[];
for plotClass=1:size(classes,3)
    [vcol symbol color]=randColorAndType(symbol , color);
    plot(classes(1,:,plotClass), classes(2,:,plotClass), vcol ,'MarkerSize',5,'LineWidth',2)
end
% Se plotea el pixel seleccionado
plot(x, y, 'rh' ,'MarkerSize',5,'LineWidth',2)

% disp(pixelsXclass)

figure
plotClasses(pixelsXclass,pixel,1);

% Se pregunta por que algoritmo quiere clasificar
adelante=true;
while  adelante
    disp('Selecciona una opcion :');
    disp('1. Minima distancia');
    disp('2. Mahalanobis');
    disp('3. Maxima porbabilidad');
    disp('4. KNN');
    disp('5. Evaluar otro vector');
    disp('6. Ver última evaluación');
    disp('7. Salir');
    opc=input('introduce tu opcion >>');
    switch opc
        case 1
            [sh ch]=minimumDistanceCriterion(pixelsXclass, pixel,true);
        case 2
            [sh ch]=mahalanobisDistanceCriterion(pixelsXclass,pixel,true);
        case 3
            [sh ch]=probabilityMaxCriterion( pixelsXclass, pixel, true );
        case 4
            [sh ch]=KNN( pixelsXclass, pixel, true );
        case 5
            close all
            imshow(img);
            [x,y]=ginput(1);
            pixel=impixel(img,x,y);
            hold on
            symbol=[];
            color=[];
            for plotClass=1:size(classes,3)
                [vcol symbol color]=randColorAndType(symbol , color);
                plot(classes(1,:,plotClass), classes(2,:,plotClass), vcol ,'MarkerSize',10,'LineWidth',3)
            end
            plot(x, y, 'rh' ,'MarkerSize',5,'LineWidth',2)

            figure
            plotClasses(pixelsXclass,pixel,1);
        case 6
            string='';
            for xsd=1:size(ch,2)
               celda{1,xsd}=['clase',num2str(xsd),' resultado es: ', num2str(ch(xsd))];
            end
            uiwait(msgbox(celda ,'About !','modal'));
        case 7
            adelante=false;
    end
    clc
end