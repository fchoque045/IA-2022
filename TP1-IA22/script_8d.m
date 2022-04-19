function script_8d()
figure('Name','Matrices generadas','NumberTitle','off');
for i = 1:15% generacion de 15 matrices
    nom = strcat('mat gris',num2str(i));%con este nombre se guarda la matriz
    m = rand(10);
    m = escala_gris(m);
    save(nom,'m');
    subplot(3,5,i); %subgrafica de 3x5
    graficar(m,nom);
end
end

function m=escala_gris(m)
[fil,col] = size(m);
for i = 1:fil %tiene que tener 15 unos
    for j = 1:col
        if m(i,j) >= 0.75
            m(i,j) = 1;
        elseif m(i,j) <= 0.15
            m(i,j) = 0;
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