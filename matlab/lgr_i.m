matrices;
T = 200e-3;
C = [1 0 0];
set(groot,'defaultLineLineWidth',1.5)

%% Ganancias del sistema
k_st = 180/pi; k_a = 100;

%% Lugar Geometrico de las Raices
sys_c = ss(A, B, C, 0);

sys = c2d(sys_c, T);
LaD = k_st * k_a * sys; % Lazo Directo

f1 = figure(1);
rlocus(LaD);
ylim([-1.5 1.5]);
xlim([-5 1]);

k = [linspace(0, 0.3, 3e3), 6];

f2 = figure(2);
rlocus(LaD, -k);
ylim([-1.5 1.5]);
xlim([-5 1]);

if ~exist('exportar', 'var')
  exportar = false;
end

if exportar
  matlab2tikz('figurehandle', f1, 'width', '6cm', 'height', '6cm', ...
    'interpretTickLabelsAsTex', true, 'parseStrings', false, ...
    'externalData', true, 'dataPath', './data', ...
    'relativeDataPath', 'Diagramas/data', 'lgr_i_pos.tex');

  matlab2tikz('figurehandle', f2, 'width', '6cm', 'height', '6cm', ...
    'interpretTickLabelsAsTex', true, 'parseStrings', false, ...
    'externalData', true, 'dataPath',  './data', ...
    'relativeDataPath', 'Diagramas/data', 'lgr_i_neg.tex');
end