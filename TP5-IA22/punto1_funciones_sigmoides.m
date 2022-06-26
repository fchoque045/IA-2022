function punto1_funciones_sigmoides(franja)
    if (franja > 0 && franja < 100)
        x = (-10:0.1:10);    
        % Valor de y de la franja
        franjaY = (1 * franja) / 100;
        
        % Funcion Logistica
        fl = @(x)(exp(-x) + 1).^(-1).*2 - 1;
        flX = valorFuncionDeX(fl, franjaY);

        % Funcion Tangente Hiperbolica
        fth = @(x) tanh(x);
        fthX = valorFuncionDeX(fth, franjaY);

        % Funcion Algebraica
        fa = @(x) (((1 + x.^2).^(-1/2))).*x;
        faX = valorFuncionDeX(fa, franjaY);

        fprintf('\nLos valores de x para que la curva ingrese a la franja del %d%s\n', franja, '%');
        fprintf('Funcion Logistica x = %f\n', flX);
        fprintf('Funcion Tangente Hiperbolica x = %f\n', fthX);
        fprintf('Funcion Algebraica x = %f\n', faX * -1);
    else
        disp('Error! el valor de la franja debe estar ENTRE 0% y 100%');
    end
end

function valor = valorFuncionDeX(y, valorY)
    syms x;
    invFunction = matlabFunction(finverse(y, x));
    valor = invFunction(valorY);
end

