function [ means ] = getMeansWithoutZeros( classes )
for classs=1:size(classes,3)
    A=classes(:,:,classs);
	L=A(A~=0);
	L=reshape(L,2,[]);
	meanT=mean(L,2);
    if classs==1
       means=meanT;
    else
        means=[means,meanT];
    end
end
return;
end

