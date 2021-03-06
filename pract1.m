clc
close all
clear all
warning off all

prompt = {'Introduce n�mero de clases:','Escribe n�mero de representantes:'};
dlg_title = 'Inicio';
num_lines = 1;
defaultans = {'5','5'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if isempty (answer)
    return
end
numClass=str2double(answer(1,1));
numRep=str2double(answer(2,1));
cordV=[];
disperV=[];
for i=1:numClass
	% disp('**********************************************************************************');
	% vector=input(['Cordenada de la clase #',num2str(i),' (ejem: "[1 1 1] � "[5 4]" ) >> ']);
	% disper=input('introduce la dispersion (ejem:  5) >> ');
	prompt = {['Introduce la cordenada de la clase #',num2str(i),'ejemplo: 1 1 1'],['Introduce la dispersion de la clase #',num2str(i)]};
	dlg_title = 'Cordenada y dispersi�n';
	num_lines = 1;
	cordDisp= inputdlg(prompt,dlg_title,num_lines);
    cord=str2num(cordDisp{1,:})
    disper=str2num(cordDisp{2,:});
    try
		if i==1
			disperV=disper;
			cordV=cord';
		else
			cordV=[cordV cord'];
			disperV=[disperV disper];
		end
	catch
		disp('se produjo un error asegurate que las cordenas tienen la misma dimesi�n');
		return
	end
end
%vector=input('introduce el vector a clasificar(ejem: "[2 3]") >> ');
prompt2 = 'Introduce el vector a clasifircar ejemplo: 4 5';
dlg_title2 = 'Vector';
num_lines2 = 1;
vectCell = inputdlg(prompt2,dlg_title2,num_lines2);
vector=str2num(vectCell{:});

classes=[];
for k=1:size(cordV,2)
	for l=1:size(cordV,1)
		classes(l,:,k)=randn(1,numRep)*disperV(k)+cordV(l,k);
	end
end
adelante=true;
while  adelante
	disp('Selecciona una opcion :');
	disp('1. Minima distancia');
	disp('2. Mahalanobis');
	disp('3. Maxima porbabilidad');
	disp('4. Evaluar otro vector');
	disp('5. Ver �ltima evaluaci�n');
	disp('6. Salir');
	opc=input('introduce tu opcion >>');
	switch opc
		case 1
			[sh ch]=minimumDistanceCriterion(classes, vector,true);
		case 2
			[sh ch]=mahalanobisDistanceCriterion(classes,vector,true);
		case 3
			[sh ch]=probabilityMaxCriterion( classes, vector, true );
		case 4
			prompt2 = 'Introduce el vector a clasifircar ejemplo: 4 5';
			dlg_title2 = 'Vector';
			num_lines2 = 1;
			vectCell = inputdlg(prompt2,dlg_title2,num_lines2);
			vector=str2num(vectCell{:});
		case 5
            string='';
            for xsd=1:size(ch,2)
                string=strcat(string,['clase',num2str(xsd),' resultado: ', num2str(ch(xsd)),'\n ']);
            end
			msgbox(string,'Result');
		case 6
			adelante=false;
	end
	clc
end