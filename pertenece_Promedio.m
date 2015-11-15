function pertenece_Promedio(vectores_distanciaCaso3, elementosPorClase, numClases)
vectorPreeliminarCaso3 = [];
contadorClase = 1;
contadorAux = 0;
vectores_distanciaCaso3
for j=1: size(vectores_distanciaCaso3,1) %vamos a recorrer todos los vectores horizontalmente para evaluar a que clase pertenecen
	%j
    belong=1;
    for i=1:size(vectores_distanciaCaso3,2)
        %vectores_distancia(j,belong)
        %vectores_distancia(j,i)
      if vectores_distanciaCaso3(j,belong) > vectores_distanciaCaso3(j,i)
        belong=i;
      end
    end
    % en vectorPreeliminar vamos a guardar la clase origen y la clase a la que se clasificó
    vectorPreeliminarCaso3(j, 1) =  contadorClase;
    vectorPreeliminarCaso3(j, 2) =  belong;
    contadorAux = contadorAux + 1;
     if elementosPorClase == contadorAux % elementosPorClase es el numero de elementos por clase de la classes
         contadorClase = contadorClase + 1;
         contadorAux = 0;
     end
     %vectorPreeliminarCaso2;
     %disp('----------------- termina vuelta ')
end
vectorPreeliminarCaso3
vectorClasesPorcetajesCaso3 = [];
%elementosPorClase = size(vectorPreeliminarCaso3,1)/D(3);
%D(1) - te da la dimension
%D(2) - el numero de elementos por clase
%D(3) - numero de clases
for i=1:numClases %va a recorrer el numero de clases que hay
    %i
    indiceVertical = (i-1) * elementosPorClase;
    porcentajeFinal = 0;
    auxIguales=0;
    for j=1:elementosPorClase
        %j
        %vectorPreeliminar(indiceVertical+j,2)
        % la posicion (j,2) debido a que en el segundo se encuentran las clases a las que pertenecen
        % y en (j,1) la clase origen
        if vectorPreeliminarCaso3(indiceVertical+j,1)==vectorPreeliminarCaso3(indiceVertical+j,2) 
            auxIguales = auxIguales +1;
        end
    end
    porcentajeFinal = (auxIguales/elementosPorClase)*100;
    vectorClasesPorcetajesCaso3(i,1)=i;
    vectorClasesPorcetajesCaso3(i,2)=porcentajeFinal;
end
vectorClasesPorcetajesCaso3
total = 0;
suma = 0;
for i=1:size(vectorClasesPorcetajesCaso3,1)
    suma = suma + vectorClasesPorcetajesCaso3(i,2);
end
total = suma/size(vectorClasesPorcetajesCaso3,1)
end