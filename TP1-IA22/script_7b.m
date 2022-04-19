function serie = script_7b()
bandera = true;
while bandera
    cant = input('Ingrese cantidad de elementos para la serie: ');
    fprintf('Ingrese el intervalo de la serie\n');
    inicio = input('inicio del intervalo: ');
    fin = input('final del intervalo: ');
    intervalo = fin - inicio;
    if intervalo < 0
        sprintf('el final del intervalo debe ser mayor que el inicio')
        continue
    end
    cifras = input('cantidad de cifras: ');
    if length(num2str(intervalo)) < cifras
        fprintf('el intervalo no puede generar numeros de %d cifras en el intervalo \n \n',cifras)        
        continue
    end
    if length(num2str(inicio)) ~= cifras
        fprintf('el intervalo no puede generar numeros de %d cifras \n \n',cifras)        
        continue
    end
        bandera = false;
end
serie = randi([inicio,fin],1,cant);
