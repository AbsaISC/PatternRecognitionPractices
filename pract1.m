clc
close all
clear all
warning off all

numClass = input('# de clases: ');
representantes = input('# de reperesentantes p/c clase: ');
%dim=input('dimension de vector: ')
cordV=[];
disperV=[];
for i=1:numClass
	vector=input(['vector de la clase #',num2str(i),' (ejem: "[X Y]" ): ']);
	disper=input('introduce la dispersión: ');
	if i==1
		disperV=disper;
		cordV=vector';
	else
		cordV=[cordV vector'];
		disperV=[disperV disper];
	end
end




return
c1 = [0 1 0 1 2; 0 1 1 0 0];
c2 = [4 4 4 5 5; 1 2 4 2 4];
c3 = [1 2 1 2 2; 4 4 5 5 6];
c4 = [5 7 5 7 6; 6 6 8 8 7];

c12 = [0 1 0 1 2; 0 1 1 0 0; 0 1 1 3 3];
c22 = [4 4 4 5 5; 1 2 4 2 4; 0 1 1 0 0];
c32 = [1 2 1 2 2; 4 4 5 5 6; 0 1 1 2 2];
c42 = [5 7 5 7 6; 6 6 8 8 7; 0 1 1 0 0];
c44 = [1 1 5 7 6; 6 6 1 1 7; 0 1 1 1 1];

classes1= cat(3,c1,c2,c3,c4);

classes2= cat(3,c12,c22,c32,c42,c44);
vector1= [ 5 4 ];
vector2= [ 6 3 2];

[posWinner1 result1 ]=minimumDistanceCriterion(classes1, vector1,true)

[posWinner2 result2]= mahalanobisDistanceCriterion(classes1,vector1,false)

[posWinner3 result3]=probabilityMaxCriterion( classes1, vector1, false )