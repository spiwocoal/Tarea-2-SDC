matrices;

%% Ganancias
k_st = 180/pi; k_a = 100;

%% Sistema
sys = ss(A, B, C, 0);
LaD = k_a * sys * k_st; % Lazo Directo

%% Ganancia controlador
kc_pos = margin(LaD);
kc_neg = -margin(-LaD);

fprintf("Ganancia positiva: %.4f\n" + ...
    "Ganancia negativa: %.4f", ...
    kc_pos, kc_neg);