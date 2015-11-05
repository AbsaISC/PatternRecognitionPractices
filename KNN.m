function [ posWinner, result ] = KNN( classes, vector, isplot )
% classes debe tener un tamaño (m x n x l)
	% m: dimension del vector
	% n: número de integrantes
	% l: número de clases

	%vector debe tener un tamaño ( k X j)
	% k: debe ser 1
	% j: es dimension del vector

%-------------------------------------------------------------------------------
	%					validacion de vector y clases
    size(vector)
	if size(vector,2) < 2
		vector=vector';
		if size(vector,2) < 2
			msgbox('La dimension del vector es menor a 2','Error');
			return;
		end
	end

	if  ~(size(classes,1) == size(vector,2))
			msgbox('El vector no tiene la misma dimension que en las clases','Error');
			return;
	end

%--------------------------------------------------------------------------------
	figure
	hold on
	grid on
	means=getMeans(classes);

	if isplot
		plotClasses(classes, vector,means);
	end
	cantClass=size(classes,3);
	distance=[];
	for i=1:size(classes,3)
		for j=1:size(classes,2)
			distance(j,:,i)=[norm(vector'-classes(:,j,i)) , i];
		end
	end

	numVecinos=0;
	while true
		prompt = {['Introduce el número de vecinos (k)']};
		dlg_title = 'Número de vecionos';
		num_lines = 1;
    	defaultans = {'15'};
		vecinos= inputdlg(prompt,dlg_title,num_lines,defaultans);
    	numVecinos=str2num(vecinos{1,:});
    	if mod(numVecinos, 2) == 0
    		uiwait(msgbox('Debe ser un número impar'));
    	else
    		break;
    	end
    end
 %    disp('distances');
	% disp(distance);

	array2sort=[];
   	for q=1:size(distance,3)
   		array2sort=[array2sort ; distance(:,:,q)];
    end

    % disp('ready');
   	% disp(array2sort);
   	sortedArray=sortrows(array2sort);

   	result2=zeros(cantClass,1);
   	for i=1:numVecinos
   		result2(sortedArray(i,2))=result2(sortedArray(i,2))+1;
   	end

   	result=[];
   	for h=1:size(result2,1)
   		result(h)=result2(h)*100/numVecinos;
   	end
	
	belong=1;
	% size(result)
	% size(result,1)
	% size(result,2)
	% result
	for i=1:size(result,2)
      if result(belong) < result(i)
        belong=i;
      end
  	end
  	posWinner=belong;
  	if isplot
  		msgbox(['The vector belongs at class ', num2str(belong)],'Result');
  	end
  	return;
end

