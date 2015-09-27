function [posWinner,result]=minimumDistanceCriterion( classes, vector, isplot )
	% classes debe tener un tamaño (m x n x l)
	% m: dimension del vector
	% n: número de integrantes
	% l: número de clases

	%vector debe tener un tamaño ( k X j)
	% k: debe ser 1
	% j: es dimension del vector

%-------------------------------------------------------------------------------
	%					validacion de vector y clases
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
	figure(1);
	hold on
	grid on
	means=getMeans(classes);

	if isplot
		plotClasses(classes, vector,means);
	end

	for i=1:size(means,2)
		distance(i)=norm(vector'-means(:,i));
	end

	belong=1;
	size(distance,2)
	for i=1:size(distance,2)
      if distance(belong) > distance(i)
        belong=i;
      end
  	end
  	result=distance;
  	posWinner=belong;
  	if isplot
  		msgbox(['The vector belongs at class ', num2str(belong)],'Result');
  	end
  	return;
end

