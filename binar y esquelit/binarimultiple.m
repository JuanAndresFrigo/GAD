%binarizar multiplea imagenes

function[]= binarimultiple(d)
clc;clear;
tipo= '*.png'; %tipo del archivo a leer
directorio = 'D:\AB todas las firmas mezcladas\1- Pruebas\'; %directorio sin nombre de archivo
nombres=get_list_files(directorio,tipo); %retorna solo los nombres

%I='Original (1).png';
%dir='D:\AB todas las firmas mezcladas\1- Pruebas\';
[m,n] = size (nombres); %m=1, n=30

for i = 1:n
    I=nombres(i);
    cadena=strcat(directorio,I);
    Im = imread(cadena{:}); %no se por que tuve que agregar-> {:} <- para que ande
    Im_u =uint8(Im);
    try
        im_entrada=rgb2gray(Im_u);    
    catch 
        im_entrada=Im_u;
    end
    [u,v] = size (im_entrada);
    im_salida = ones(u,v); %imagen de igual tamaño entera blanca
    %{
    suma=0;
    cont=0;
    for z=1:u
        for x = 1:v
            suma=suma+im_entrada(z,x);
            cont=cont+1;
        end
    end
    
    T=(suma/cont); %umbral de comparacion 
    %}
    T=215;

    for r=1:u
        for s = 1:v
            if(im_entrada(r,s)>T)
                im_salida(r,s) = 1; %blanco
            else
                im_salida(r,s) =0; %negro
            end
        end
    end
    directorio_salida= strcat(directorio,'8\',I);
    imwrite(im_salida,directorio_salida{:});
end