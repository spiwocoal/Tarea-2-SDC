sims_b;

dpsi = x(:,2) * 180/pi;
omega = x(:,3) * 60/(2*pi);

%% Graficar simulación
f1 = figure(1);

plot(t, psi_m, 'r', t, psi_d, 'r--');
title("Ángulo de referencia y la salida obtenida");
xlabel("Tiempo $[\unit{s}]$");
ylabel("$\rojo{\psi}\ [\unit{deg}]$");
legend('Ángulo medido $\rojo{\psi_{m}}$', 'Referencia $\rojo{\psi_{d}}$');


f2 = figure(2);

subplot(2,2,1);
plot(t, w, 'b');
title("Entrada al actuador");
xlabel("Tiempo $[\unit{s}]$");
ylabel("$\azul{w}$");

subplot(2,2,2);
plot(t, v_i, 'g');
title("Voltaje del motor");
xlabel("Tiempo $[\unit{s}]$");
ylabel("$\verd{v_{i}}\ [\unit{V}]");

subplot(2,2,3);
plot(t, dpsi, 'r');
title("Velocidad angular de la bolita");
xlabel("Tiempo $[\unit{s}]$");
ylabel("$\rojo{dot{\psi}}\ [\unit{deg/s}]$");

subplot(2,2,4);
plot(t, omega);
title("Velocidad angular del anillo");
xlabel("Tiempo $[\unit{s}]$");
ylabel("$\mora{\omega}\ [\unit{RPM}]$");

if ~exist('exportar', 'var')
  exportar = false;
end

if exportar
  matlab2tikz('figurehandle', f1, 'width', '0.9\textwidth', 'height', '0.3\textheight', ...
    'interpretTickLabelsAsTex', true, 'parseStrings', false, './psi_b.tex');

  matlab2tikz('figurehandle', f2, 'width', '0.9\textwidth', 'height', '0.6\textheight', ...
    'interpretTickLabelsAsTex', true, 'parseStrings', false, './estado_b.tex');
end