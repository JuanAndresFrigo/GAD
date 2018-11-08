function features = alr3(dirImagen, nAngulos, nProporciones) 
    %centroide
    imagen=imread(dirImagen);
    %[m,n]=size(imagen);
    P=imagePoints(dirImagen);    
    pTam=size(P);
    centroide=centroidOf(dirImagen);
    %histograma en blanco de 10x10
    histograma = zeros(nAngulos, nProporciones);
    
    angulos = [0:180/nAngulos:180]; %0    18    36    54    72    90   108   126   144   162   180
    proporciones = [0:1/nProporciones:1]; % 0    0.1000    0.2000    0.3000    0.4000    0.5000    0.6000    0.7000    0.8000    0.9000    1.0000

    for i= 1: 6
        for j= 1: 6
            if (i~=j)
                angulo= anglesBetween(centroide, P(i,:),P(j,:));
                propor= proporcion(centroide, P(i,:), P(j,:));

                angleRangeInterval = find(angulos < angulo);
                angleRangeInterval = angleRangeInterval(end);
                    
                proportionRangeInterval = find(proporciones < propor);
                proportionRangeInterval = proportionRangeInterval(end);

                histograma(angleRangeInterval, proportionRangeInterval) = 1 + histograma(angleRangeInterval, proportionRangeInterval);    
                
            end
        end
    end    
     features = histograma();
        %{    
    % Normalization        
    features = histograma(:);      
    features_norm = norm(features);        
    if(features_norm > 0)
                features = features/features_norm;
    end        
        %}
end            
            
            
        