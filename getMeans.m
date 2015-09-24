function [ means ] = getMeans( classes )
for classs=1:size(classes,3)
	meanT=mean(classes(:,:,classs),2);
    if classs==1
       means=meanT;
    else
        means=[means,meanT];
    end
end
return;
end

