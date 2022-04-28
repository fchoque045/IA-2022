function punto5(opcion)
    x=linspace(0,10,100);
    %funciones de calidad
    baja = zmf(x,[1 2.5]);
    media = gaussmf(x,[1.25 5]);
    alta = smf(x,[6 8]);
    %funciones de precio
    barato = trapmf(x,[0 0 1 3]);
    accesible = trapmf(x,[2 4.5 5.5 8]);
    caro = trapmf(x,[6 8 10 10]);

    if strcmp(opcion,'c1')
        opcion_c1(x,barato,baja)
    elseif strcmp(opcion,'c2')
        opcion_c2(x,caro,alta)
    elseif strcmp(opcion,'c3')
        opcion_c3(x,accesible,media)
    else
        fprintf('error! debe elegir una opcion correcta');
    end
end

function opcion_c1(x,barato,baja)
    c1 = min(barato,baja);
    graficar(x,barato,baja,c1,'barato','baja calidad','barato y de baja calidad')
end
function opcion_c2(x,caro,alta)
    %ALGO(A) = INT(CON(A)) AND NOT(CON(A))
    algo_caro = min(intens(concen(caro)),complem(concen(alta)));
    %UN POCO(A) = INT(DIL(A) AND INT(DIL(NOT(A)
    poco_alta = min(intens(dilac(caro)),intens(dilac(complem(alta))));
    c2 = max(algo_caro,poco_alta);
    graficar(x,algo_caro,poco_alta,c2,'algo caro','poco alta', 'algo caro o de calidad un poco alta')
end

function opcion_c3(x,accesible,media)
    no_accesible = complem(accesible);
    %a XNOR b = (a AND b) OR (NOT(a) AND NOT(b))
    c = max(min(no_accesible,media),min(complem(no_accesible),complem(media)));
    graficar(x,no_accesible,media,c,'no accesible','media','Precio No accesible XNOR calidad media')
end

function f1 = concen(mu0)
    f1 = mu0.^2;
end

function f2 = dilac(mu0)
    f2 = mu0.^(1/2);
end

function f3 = intens(mu0) 
    f3 =(2*mu0.^2).*(mu0<=0.5) + (1-2*(1-mu0).^2).*(mu0>0.5);
end

function f4 = complem(mu0)
    f4 = 1-mu0;
end

function graficar(x,y1,y2,y3,leg1,leg2,leg3)
    hold on
    plot(x,y1,'r--','LineWidth',1.5);
    plot(x,y2,'b--','LineWidth',1.5);
    plot(x,y3,'k','LineWidth',2);
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    legend(leg1,leg2,leg3);
    hold off
end
