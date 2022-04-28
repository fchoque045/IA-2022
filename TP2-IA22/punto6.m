function [x0,mu0,mumod] = punto6(x0,mu0,adv1,adv2,adv3)
    if size(x0)==size(mu0)
        if min(mu0) < 0 || max(mu0) > 1
            error('los valores de mu deben estar en el intervalo 0,1')
        end
    else
        error('la longitud de x y mu deben ser iguales...')
    end
    graficar(x0, mu0,'r--');
    switch nargin
        case 5
            mumod = seleccion_adverbio(mu0,adv1);
            graficar(x0, mumod,'b');
            mumod = seleccion_adverbio(mumod,adv2);
            graficar(x0, mumod,'g');
            mumod = seleccion_adverbio(mumod,adv3);
            graficar(x0, mumod,'m');
            legend('A',strcat(adv1,'(A)'),strcat(adv2,'(',adv1,'(A))'),strcat(adv3,'(',adv2,'(',adv1,'(A)))'));
        case 4
            mumod = seleccion_adverbio(mu0,adv1);
            graficar(x0, mumod,'b');
            mumod = seleccion_adverbio(mumod,adv2);
            graficar(x0, mumod,'g');
            legend('A',strcat(adv1,'(A)'),strcat(adv2,'(',adv1,'(A))'));
        case 3
            mumod = seleccion_adverbio(mu0,adv1);
            graficar(x0, mumod,'b');
            legend('A',strcat(adv1,'(A)'));
        otherwise
            error('debe ingresar 1, 2 o 3 adverbios...')
    end
end
    
function mumod = seleccion_adverbio(mu0,adv)
    adverbios={'muy','no','algo','aproximadamente', 'mas','menos', 'masomenos', 'sumamente'};    
    if strcmp(adverbios(1,1),adv)
        mumod = concen(mu0);
    elseif strcmp(adverbios(1,2),adv)
        mumod = no(mu0);
    elseif strcmp(adverbios(1,3),adv)
        mumod = algo(mu0);
    elseif strcmp(adverbios(1,4),adv)
        mumod = dilac(dilac(mu0));
    elseif strcmp(adverbios(1,5),adv)
        mumod = mas(mu0);
    elseif strcmp(adverbios(1,6),adv)
        mumod = menos(mu0);
    elseif strcmp(adverbios(1,7),adv)
        mumod = dilac(mu0);
    elseif strcmp(adverbios(1,8),adv)
        mumod = sumamente(mu0);
    else 
        error('no se encontro el adverbio, intente con otro...')
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

function no = no(mu0)
    no = (1-mu0);
end

function algo = algo(mu0)
    termino1 = intens(concen(mu0));
    termino2 = no(concen(mu0));
    [fil,col] = size(mu0);
    algo = zeros(fil,col);
    for i=1:col
        if termino1(1,i)<termino2(1,i)
            algo(1,i) = termino1(1,i);
        else
            algo(1,i) = termino2(1,i);
        end
    end
end

function mas = mas(mu0)
    mas = mu0.^1.25;
end

function menos = menos(mu0)
    menos = mu0.^1.25;
end

function sumamente = sumamente(mu0)
    sumamente = mu0.^3;
end

function graficar(x, mu0, color)
    hold on    
    plot(x, mu0, color,'LineWidth', 1.5);
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    hold off
end
