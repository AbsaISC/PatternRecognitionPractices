function [posWinner, result]  =  mahalanobisDistanceCriterion( classes, vector , isplot)
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
	figure
	hold on
	grid on
	means=getMeans(classes);

	if isplot
		plotClasses(classes, vector,means);
	end
	
	%matrixS=cat(3,zeros(size(matrix0,1)),zeros(size(matrix0,1)),zeros(size(matrix0,1)),zeros(size(matrix0,1)));
  	matricesVC = getMatricesVC( classes , means );
  	
  	for i=1:size(matricesVC,3)
  		mhlDist(i)=((vector-means(:,i)')*inv(matricesVC(:,:,i)))*(vector-means(:,i)')';
  	end

  	belong=1;
  	for i=1:size(mhlDist,2)
      if mhlDist(belong) > mhlDist(i)
        belong=i;
      end
  	end
  	result=mhlDist;
  	posWinner=belong;
  	if isplot
  		msgbox(['The vector belongs at class ', num2str(belong)],'Result');
  	end
  	return;
  
end