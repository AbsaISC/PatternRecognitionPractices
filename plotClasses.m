function plotClassse( classes , vector, means)
%------------------------------------------------------------------------------
	%		grafia las clases si las dimensiones son 2 o 3
	%figure(1);
	hold on
	grid on
	tamvect=size(vector)
	if size(vector,2)==2
        % msgbox('grafiga 2d')
        vleg=[];
        symbol=[];
        color=[];
		for classs=1:size(classes,3)
			[vcol symbol color]=randColorAndType(symbol , color);
			plot(classes(1,:,classs), classes(2,:,classs), vcol ,'MarkerSize',10,'LineWidth',3)
			if classs==1
				vleg= ['clase #',num2str(classs)];
			else
				vleg=cat(1, vleg, ['clase #',num2str(classs)]);
			end
			%plot(means(1,classs), means(2,classs), vcol, 'MarkerSize', 15, 'LineWidth',3)
			%vleg=cat(1, vleg, ['media #',num2str(classs)]);
			%x=[means(1,classs),vector(1)];
			%y=[means(2,classs),vector(2)];
			%plot(x,y)
			%vleg=cat(1, vleg, ['linea #',num2str(classs)]);
		end
		%plot(vector(1), vector(2), 'rh', 'MarkerSize', 20, 'LineWidth',5)
		legend(vleg)
	end

	if size(vector,2)==3
        % msgbox('grafica 3d')
        vleg=[];

        symbol=[];
        color=[];
		for classs=1:size(classes,3)
			[vcol symbol color]=randColorAndType(symbol , color);
			plot3(classes(1,:,classs), classes(2,:,classs),classes(3,:,classs),vcol,'MarkerSize',10,'LineWidth',3)
			if classs==1
				vleg= ['clase #',num2str(classs)];
			else
				vleg=cat(1, vleg, ['clase #',num2str(classs)]);
			end
			% plot3(means(1,classs), means(2,classs),means(3,classs), vcol, 'MarkerSize', 15, 'LineWidth',3)
			% vleg=cat(1, vleg, ['media #',num2str(classs)]);
			% x=[means(1,classs),vector(1)];
			% y=[means(2,classs),vector(2)];
			% z=[means(3,classs),vector(3)];
			% plot3(x,y,z)
			% vleg=cat(1, vleg, ['linea #',num2str(classs)]);
		end
		plot3(vector(1), vector(2),vector(3), 'rh', 'MarkerSize', 20, 'LineWidth',5)
		legend(vleg)
	end

	if size(vector,2)>3
		msgbox('El vector tiene una dimension mayor a 3 y no se puede plotear','Warning');
	end


end

