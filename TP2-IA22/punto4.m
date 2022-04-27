function punto4(x, mu0, funcion)
    if length(x) ~= length(mu0)
        fprintf('Los vectores no tienen la misma longitud');
    elseif min(mu0) < 0 || max(mu0) > 1
        fprintf('Los grados de pertenencia deben estar en el intervalo 0,1');
    elseif strcmp(funcion,'concen')
        concentracion = concen(mu0);
        graficar(x, mu0, concentracion, 'concentración');
    elseif strcmp(funcion,'dilac')
        dilucion = dilac(mu0);
        graficar(x, mu0, dilucion, 'dilución');
    elseif strcmp(funcion,'intens')
        intensificacion = intens(mu0);
        graficar(x, mu0, intensificacion, 'intensificación');
    elseif strcmp(funcion,'difum')
        difuminacion = difum(mu0);
        graficar(x, mu0, difuminacion, 'difuminación');
    else
        fprintf('Error! debe elegir una funcion correcta');
    end    
end

function concentracion = concen(mu0)
    concentracion = mu0.^2;
end

function dilucion = dilac(mu0)
    dilucion = mu0.^(1/2);
end

function intensificacion = intens(mu0) 
    intensificacion =(2*mu0.^2).*(mu0 <= 0.5) + (1-2*(1-mu0).^2).*(mu0 > 0.5);
end

function difuminacion = difum(mu0)
    difuminacion = ((mu0/2).^(1/2)).*(mu0 <= 0.5) + (1-((1-mu0)/2).^(1/2)).*(mu0 > 0.5);
end

function graficar(x, mu0, f, nombre)
    hold on
    plot(x, mu0, 'r--','LineWidth', 1.5);
    plot(x, f, 'b', 'LineWidth', 1.5);
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    legend('funcion original', nombre);
    hold off
end