function minimumDistanceResistitution_Cross_Hold( classes, vector, isplot )
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
%size(matriz,DIM) nos regresa el numero de elementos en la segunda
%dimension
D = size(classes);
elementosPorClase = length(classes);
valorAnterior = 1;
for i=2:size(D,2) % comenzamos desde el 2 por que el uno es la dimension de los vectores, osea que un vector de compone de todos los elementos en la posicion 1
    valorAnterior = D(i) * valorAnterior;
end % al final valorAnterior va a tener la cuenta del total de elementos (vectores) que hay en la matriz classes
%distancias = [];
%for i=1:valorAnterior
 %   distancias(i) = norm(vector' - classes(:,i)); % distancia a cada uno
 %   de los puntos
%end
%distancias
vectores_distancia = [];
valorAnterior
for j=1: valorAnterior %vamos a recorrer todos los vectores X de la matriz Classes
	for i=1:size(means,2) % vamos a hacer la evaluaci�n contra cada clase
		distance(i) = 0; % para tener un valor de default
        distance(i)=norm(classes(:,j)-means(:,i));
        vectores_distancia(j,i) = norm(classes(:,j)-means(:,i));
    end
end
vectores_distancia;
%en la siguiente funcion solamente vamos a ver a que clase pertenece que
%vector e imprimir en pantalla los resultados
disp('Caso 1')
pertenece_Promedio(vectores_distancia, length(classes),D(3))
%------------------------------------------------------------ termina caso 1
%---------------------------------------------------------------- comienza el de mitades caso 2
matrizO = [];
matrizP = [];
auxiliarMitad = floor(elementosPorClase / 2);
modulo = mod(elementosPorClase, 2);
largoElementosMitad1 = auxiliarMitad + modulo;
largoElementosMitad2 = auxiliarMitad;
contadorPosicionClasses = 0;
for i=1:D(3) % hasta el numero de clases
    for j=1:largoElementosMitad1
        contadorPosicionClasses = contadorPosicionClasses + 1;
        matrizO(:,j,i) = classes(:,contadorPosicionClasses);
    end
    for j=1:largoElementosMitad2
        contadorPosicionClasses = contadorPosicionClasses + 1;
        matrizP(:,j,i) = classes(:,contadorPosicionClasses);
    end
end
%classes
%matrizO
%matrizP
means=getMeans(matrizO);
D2 = size(matrizP);
valorAnterior = 1;
for i=2:size(D2,2) % comenzamos desde el 2 por que el uno es la dimension de los vectores, osea que un vector de compone de todos los elementos en la posicion 1
    valorAnterior = D2(i) * valorAnterior;
end % al final valorAnterior va a tener la cuenta del total de elementos (vectores) que hay en la matriz matrizP
vectores_distanciaCaso2 = [];
valorAnterior;
for j=1: valorAnterior %vamos a recorrer todos los vectores X de la matriz Classes
	for i=1:size(means,2) % vamos a hacer la evaluaci�n contra cada clase
        vectores_distanciaCaso2(j,i) = norm(matrizP(:,j)-means(:,i));
    end
end
vectores_distanciaCaso2;
%en la siguiente funcion solamente vamos a ver a que clase pertenece que
%vector e imprimir en pantalla los resultados
disp('Caso 2')
pertenece_Promedio(vectores_distanciaCaso2, largoElementosMitad2,D(3))
%------------------------------------------------------------ termina caso 2
%----------------------------------------------------------- comienza caso 3
%c=input('hola')
valorAnterior = 1;
for i=2:size(D,2) % comenzamos desde el 2 por que el uno es la dimension de los vectores, osea que un vector de compone de todos los elementos en la posicion 1
    valorAnterior = D(i) * valorAnterior;
end % al final valorAnterior va a tener la cuenta del total de elementos (vectores) que hay en la matriz classes

vectores_distanciaCaso3 = [];
for indiceVectorCopiar=1: valorAnterior %hasta el numero de vectores que hay en la matriz classes
    indiceVectorCopiar;
    indicePosicion = 1;
    indiceInternoP = 1;
    indiceInternoO = 1;
    auxiliar=1;
    p = [];
    o = [];
    elementosPorClase = size(classes,2);
    D(3);
    for h=1:D(3)
        auxiliar = elementosPorClase*(h-1);
        for m=1:elementosPorClase
            indicePosicion = auxiliar + m;
            %en la siguiente condicion solo entra cuando esta en la clase a quitarle un elemento
            if(auxiliar < indiceVectorCopiar && h*elementosPorClase >= indiceVectorCopiar)
                if( indicePosicion == indiceVectorCopiar) %copiamos solo el vector que toca
                    x = classes(:,indicePosicion);
                else %copiamos los demas de la clase
                    o(:,indiceInternoP)=classes(:,indicePosicion);
                    indiceInternoP = indiceInternoP + 1;
                end
            else %en la matriz O vamos a copiar todas las demas clases
                p(:,indiceInternoO) = classes(:,indicePosicion);
                indiceInternoO = indiceInternoO + 1;
            end
            %auxiliar = auxiliar + m;
        end
    end
    classes;
    x;
    o;
    p;
    %vamos a hacer un for para ver en que clase estael vector x tomado
    x_estaEnClase = 0;
    for i=1:D(3)
        if(elementosPorClase*(i-1)< indiceVectorCopiar && indiceVectorCopiar <= elementosPorClase*i)
            x_estaEnClase = i;
        end
    end
    largoO = size(o,2);
    largoP = size(p,2);
    meansO=getMeans(o);
    numeroClasesRestantes = D(3)-1;
    restantesP = [];
    indiceAux1 = 1;
    for i = 1: numeroClasesRestantes 
        for j = 1: elementosPorClase
            restantesP(:,j,i) = p(:,indiceAux1);
            indiceAux1 = indiceAux1 + 1;
        end
    end
    restantesP;
    meansP=getMeans(restantesP);
    indiceMeans = 1;
    x_estaEnClase;
    %vamos a obtener las distancias del vector x a cada una de las clases
    for i=1:D(3)
        if(i == x_estaEnClase)
            %fprintf('indice = %d, i = %d, valor = %f',indiceVectorCopiar,i,norm(x - meansO))
            vectores_distanciaCaso3(indiceVectorCopiar,i) = norm(x - meansO);
        else
            %fprintf('indice = %d, i = %d, valor = %f',indiceVectorCopiar,i,norm(x - meansP(:,indiceMeans)))
            vectores_distanciaCaso3(indiceVectorCopiar,i) = norm(x - meansP(:,indiceMeans));
            indiceMeans = indiceMeans +1;
        end
    end
end
%--- termina iteracion
vectores_distanciaCaso3;
%en la siguiente funcion solamente vamos a ver a que clase pertenece que
%vector e imprimir en pantalla los resultados
disp('Caso 3')
pertenece_Promedio(vectores_distanciaCaso3, length(classes),D(3))
%-----------------------------------------------------------------termina caso 3
%vectorClasesPorcetajes
%vectorClasesPorcetajesCaso2
%magia = (vectorClasesPorcetajes + vectorClasesPorcetajesCaso2)/2
%total = 0;
%suma = 0;
%for i=1:size(vectorClasesPorcetajesCaso2,1)
%    suma = suma + vectorClasesPorcetajesCaso2(i,2);
%end
%total = suma/size(vectorClasesPorcetajesCaso2,1)

end

