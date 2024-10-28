matrices;

%% Ganancias
k_st = 180/pi; k_a = 100;

%% Sistema
s = tf('s');
sys = ss(A, B, C, 0);
LaD = 1/s * k_a * sys * k_st; % Lazo Directo

%% Ganancia controlador
kc = margin(LaD);

fprintf("Ganancia positiva: %.4f\n", kc);