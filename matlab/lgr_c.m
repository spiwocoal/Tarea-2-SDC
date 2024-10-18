matrices;
C = [1 0 0];
set(groot,'defaultLineLineWidth',1.5)

%% Ganancias del sistema
k_st = 180/pi; k_a = 100;

%% Lugar Geometrico de las Raices

sys = ss(A, B, C, 0);
LaD = k_st * k_a * sys; % Lazo Directo
k = linspace(0, 1, 3e3);

f1 = figure(1);
rlocus(LaD, k);
ylim([-40 40]);
xlim([-12 2]);

f2 = figure(2);
rlocus(LaD, -k);
ylim([-40 40]);
xlim([-12 2]);

if ~exist('exportar', 'var')
  exportar = false;
end

if exportar
  matlab2tikz('figurehandle', f1, 'width', '6cm', 'height', '6cm', ...
    'interpretTickLabelsAsTex', true, 'parseStrings', false, ...
    'externalData', true, 'dataPath', './data', ...
    'relativeDataPath', 'Diagramas/data', 'lgr_c_pos.tex');

  matlab2tikz('figurehandle', f2, 'width', '6cm', 'height', '6cm', ...
    'interpretTickLabelsAsTex', true, 'parseStrings', false, ...
    'externalData', true, 'dataPath',  './data', ...
    'relativeDataPath', 'Diagramas/data', 'lgr_c_neg.tex');
end