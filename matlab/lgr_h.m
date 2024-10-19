matrices;
set(groot,'defaultLineLineWidth',1.5)

%% Ganancias del sistema
k_st = 180/pi; k_a = 100;

%% Lugar Geometrico de las Raices

s = tf("s");
sys = ss(A, B, C, 0);
LaD = (1/s) * k_st * k_a * sys; % Lazo Directo
k = linspace(0, 6, 5e3);

f1 = figure(1);
rlocus(LaD, k);
ylim([-20 20]);
xlim([-10 10]);

f2 = figure(2);
rlocus(LaD, -k);
ylim([-20 20]);
xlim([-10 10]);

if ~exist('exportar', 'var')
  exportar = false;
end

if exportar
  matlab2tikz('figurehandle', f1, 'width', '6cm', 'height', '6cm', ...
    'interpretTickLabelsAsTex', true, 'parseStrings', false, ...
    'externalData', true, 'dataPath', './data', ...
    'relativeDataPath', 'Diagramas/data', 'lgr_h_pos.tex');

  matlab2tikz('figurehandle', f2, 'width', '6cm', 'height', '6cm', ...
    'interpretTickLabelsAsTex', true, 'parseStrings', false, ...
    'externalData', true, 'dataPath',  './data', ...
    'relativeDataPath', 'Diagramas/data', 'lgr_h_neg.tex');
end