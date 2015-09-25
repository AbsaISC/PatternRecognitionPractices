function [ matricesVC] = getMatricesVC( classes , means )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
	for i=1:size(classes,3)
    	for j=1:size(classes,2)
      		clssSmean(:,j,i)=classes(:,j,i)-means(:,i);
    	end
    	matricesVC(:,:,i)  =(1/size(classes,2))*(clssSmean(:,:,i) * clssSmean(:,:,i)');
  	end

end

