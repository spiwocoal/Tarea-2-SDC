matrices;
T = 200e-3;

%% Ganancias del sistema
k_st = 180/pi; k_a = 100; 

%% Lugar Geometrico de las Raices
sys_c = ss(A, B, C, 0);

z = tf('z', T);
sys = c2d(sys_c, T);
ret = 1/z; % Retardo por calculo
LaD =  ret * k_a * sys * k_st; % Lazo Directo discreto

%Kc Positivos
Kc_mar = allmargin(LaD);
Kc_mar.GainMargin

%Kc Negativos
Kc_mar = allmargin(-LaD);
Kc_mar.GainMargin