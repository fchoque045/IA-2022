function punto6_test(net)
% Generacion de valores
y = randsample(linspace(0,2 * pi, 1000), 20); 
x = randsample(linspace(0,2 * pi, 1000), 20); 
z = randsample(linspace(-1, 1, 1000), 20);
test = vertcat(x,y, z);
[fil,col] = size(test);

salida_obtenida = ones(1,20);
for i =1:col
    salida_obtenida(i)=net(test(:,i));
end

fun = @(x,y,z) sin(x)+cos(y)+z;
salida_deseada = fun(x,y,z);

error = mse(salida_deseada-salida_obtenida);
fprintf('Error cuadratico medio:\n');
disp(error);
hold on    
plot(linspace(1,20,20), salida_deseada, 'b','LineWidth', 1.5);
plot(linspace(1,20,20), salida_obtenida, 'r--','LineWidth', 1.5);
xlabel('Patron');
ylabel('Valor');
legend('valor real','aproximacion');
hold off
end



