function centroidR =centroidOf(directorio)
    %clc;clear;
   % directorio='C:\Users\Juan Andres\Desktop\1.png'; %no va  aser necesario, solo fue para probarlo
    image= imread(directorio); %idem
    
    num_pixeles=0; %contador para el total de pixeles negros
    contx=0;       %contador para promediar x
    conty=0;       %contador para promediar y
    centrox=0;     %coordenada x del centroide
    centroy=0;     %coordenada y del centride
    
    [m,n] = size (image); %m fila, n columna
    
    for i=1:m
        for j = 1:n % es /3 porque toma los tres planos de la imagen
            if(image(i,j)==0)                   %si en la posicion hay un pixel negro
                num_pixeles= 1 + num_pixeles;   %incremento el contador de pixeles
                contx= contx+j;                 %sumo la posicion del x
                conty=conty+i;                  %sumo la posicion del y
            end
        end
    end
    centrox =(contx/num_pixeles);   %promedio del x
    centroy =(conty/num_pixeles);   %promedio del y
    centroid =[centrox centroy];    %matriz de 1x2
    centroidR=round(centroid);      %redondeo al entero mas cercano

