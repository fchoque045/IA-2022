function script_8()
muestra = [0 0 0 0 0 0 0 0 0 0; 
               0 0 0 0 0 0 1 0 0 0; 
               0 0 0 0 1 1 0 1 0 0; 
               0 0 0 1 0 0 0 0 1 0; 
               0 0 1 0 0 0 0 0 0 1;
               0 0 1 0 0 0 0 0 0 1;
               0 1 0 0 0 0 0 0 0 1;
               0 0 1 0 0 0 0 0 0 0;
               0 0 0 1 0 0 0 0 0 0;
               0 0 0 0 1 0 0 0 0 0;];
figure('Name','Matriz de muestra','NumberTitle','off');
graficar(muestra,'matriz de muestra');

figure('Name','Matrices generadas','NumberTitle','off');
similitud = zeros(1,15);
for i = 1:15% generacion de 15 matrices
    nom = strcat('m',num2str(i));%con este nombre se guarda la matriz
    m = generar_matriz(10);
    save(nom,'m');
    subplot(3,5,i); %subgrafica de 3x5
    graficar(m,nom);
    similitud(i)= jaccard(muestra,m);
end
similitud = similitud'; 
matrices = ["m1";"m2";"m3";"m4";"m5";"m6";"m7";"m8";"m9";...
    "m10";"m11";"m12";"m13";"m14";"m15"];
T = table(matrices,similitud);
fprintf('similitud de las matrices con la matriz de muestra\n');
disp(T)
end

function m = generar_matriz(a)
m = zeros(a,a); %primero una matriz con ceros 
for i = 1:15 %tiene que tener 15 unos
    verdad = 1;
    while verdad == 1
        fil = randi([1,10]);%indica en que posicion iria el 1
        col = randi([1,10]);
        if m(fil,col) == 0
            m(fil,col)=1;
            verdad = 0;
        end    
    end 
end
end

function graficar(m,titulo)
  imagesc(m);
  colormap(flipud(gray)); %voltea matrices en la dirección vertical
  set(gca, 'XTick', [], 'YTick', []);
  title(titulo);
end