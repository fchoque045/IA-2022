function a = generar_matriz(matriz)
A=randi([-1,1],15,15)
[filA,colA]=size(A);
[fil, col]=size(matriz);
encontrado=true;
if (col~=2) || (fil~=3)
	warning('no se encontro la matriz ingresada...')
	encontrado=false;
else
	for i=1:fil
    	for j=1:col
        	if (matriz(i,j)~=-1) && (matriz(i,j)~=0) && (matriz(i,j)~=1)
            	warning('no se encontro la matriz ingresada...')
            	encontrado=false;
        	end
        	if encontrado==false
            	break
        	end    
    	end
    	if encontrado==false
        	break
    	end
	end
end
if encontrado==true
	for i=1:(filA-fil+1)
    	for j=1:(colA-col+1)
        	if A(i:(i+fil-1),j:(j+col-1))==matriz
           	a=[i,j];
           	return
        	end
        	if (i==(filA-fil+1)) && (j==(colA-col+1))
            	encontrado=false;
        	end    
    	end
	end
end
if encontrado==false
	for i=1:(filA-1)
    	for j=1:(colA-1)
        	if (A(i,j)>=0) && (A(i,j+1)>=0)
           	if (A(i+1,j)>=0) && (A(i+1,j+1)>=0)
               	a=[i,j];
               	return
           	end    
        	end    
    	end
	end
end

