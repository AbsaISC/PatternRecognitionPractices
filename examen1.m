%Examen
classes(1,:,1)=[200 210 215 210 198];
classes(2,:,1)=[160 170 172 165 177];
classes(3,:,1)=[120 130 133 134 138];

classes(1,:,2)=[90 92 87 91 85];
classes(2,:,2)=[130 138 128 134 123];
classes(3,:,2)=[60 54 66 60 55];

classes(1,:,3)=[30 20 24 28 22];
classes(2,:,3)=[44 40 42 50 46];
classes(3,:,3)=[178 180 184 176 181];
% classes(:,:,3)
% return;
figure(1);
vector=[87 128 60];
adelante=true;
while  adelante
	disp('Selecciona una opcion :');
	disp('1. Minima distancia');
	disp('2. Mahalanobis');
	disp('3. Maxima porbabilidad');
	disp('4. Evaluar otro vector');
	disp('5. Nuevo vector');
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
            vector=input('Type new vector>> ');
		case 6
			adelante=false;
    end
    disp(ch);
	% clc
end