function [ posWinner, result ] = probabilityMaxCriterion( classes, vector, isplot )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
means=getMeans(classes); 
matricesVC = getMatricesVC( classes , means );
[pos resp]= mahalanobisDistanceCriterion( classes, vector , false);
	figure(3);
	hold on
	grid on
	if isplot
		plotClasses(classes, vector,means);
	end

	for i=1:size(classes,3)
		elev=(-0.5)*resp(i);
		result(i)=(1/(2*pi*(det( matricesVC(:,:,i)^(-0.5) )) ))*exp(elev);
	end
	
	belong=1;
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
