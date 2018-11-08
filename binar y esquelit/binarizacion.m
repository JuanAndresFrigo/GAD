%funcion para binarizar una imagen

function [im_salida]= binarizacion(I)
%clc;clear;
%I='Original (1).png';
%dir='D:\AB todas las firmas mezcladas\1- Pruebas\';
I=    'D:\AB todas las firmas mezcladas\1- Pruebas\Original (18).png';
cadena=strcat(I);
Im = imread(cadena);

Im_u =uint8(Im);

im_entrada=rgb2gray(Im_u);

%imshow(I);

  [m,n] = size (im_entrada);
  im_salida = ones(m,n); %imagen de igual tamaño entera blanca
  T=220; %parametro de comparacion

for i=1:m
    for j = 1:n
         if(im_entrada(i,j)>T)
             im_salida(i,j) = 0; %negro
         else
             im_salida(i,j) =1; %blanco
         end
    end
end
imshow(im_salida);


