function punto2_base_radial(s)
x = (-10:0.1:10);
i = ones(1,201); %para graficar asintota
y =0.01; %franja del 1%
fa = @(x,s) exp(-(x.^2)/(2*s^2)); %funcion gaussiana
vxfa = @(y,s) (2*(-log(y))*(s^2))^(1/2); %despejar x de fa

fb = @(x,s) (s^2)./((s^2)+(x.^2)); %funcion inversa cuadratica
vxfb = @(y,s) s*((1/y)-1)^(1/2); %despejar x de fb

fc = @(x,s) s./(((s^2)+(x.^2)).^(1/2)); %funcion inversa multicuadratica
vxfc = @(y,s) s*((1/(y^2))-1)^(1/2); %despejar x de fc

%puntos en donde cada funcion llega a 0.01
x1=vxfa(y,s);
x2=vxfb(y,s);
x3=vxfc(y,s);

subplot(1,2,1)
subplot('Position',[0.1 0.1 0.4 0.8])
hold on
plot(x,fa(x,s),'LineWidth',1.5);
plot(x,fb(x,s),'LineWidth',1.5);
plot(x,fc(x,s),'LineWidth',1.5);
plot(x,(i*y),'k--','LineWidth',1)
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
legend('gaussiana','inversa cuadratica', 'inversa multicuadratica')
title('Funciones con base radial')
hold off
graficar_circulo(x1,x2,x3)

disp('Los valores de x para que la curva ingrese a la franja del 1%');
fprintf('con sigma = %.1f\n',s);
fprintf('para la funcion gaussiana x = %f\n',x1);
fprintf('para la funcion inversa cuadratica x = %f\n',x2);
fprintf('para la funcion inversa multicuadratica x = %f\n',x3);

end

function graficar_circulo(r1,r2,r3)
subplot(1,2,2)
subplot('Position',[0.55 0.1 0.4 0.8])
tita = (0:0.01:2.01*pi);
fx = @(r,tita) r*cos(tita);
fy = @(r,tita) r*sin(tita);
hold on
plot(fx(r1,tita),fy(r1,tita),'LineWidth',1.5);
plot(fx(r2,tita),fy(r2,tita),'LineWidth',1.5);
plot(fx(r3,tita),fy(r3,tita),'LineWidth',1.5);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
title('Base circular asociada')
hold off
end