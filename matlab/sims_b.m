matrices;
psi_0 = 30 * pi/180;

%% Ganancias del sistema
k_st = 180/pi; k_a = 100; k_c = 10e-3;

%% Simulación
t = linspace(0, 10, 1e4);
psi_d = psi_0 .* k_st .* (rampa(t - 1) - rampa(t - 5)) ./ 4;

cnt = k_c; % Controlador proporcional
sys = ss(A, B, C, 0);
LaD = cnt * k_a * sys; % Lazo Directo
LaC = feedback(LaD, k_st); % Lazo Cerrado

[psi, ~, x] = lsim(LaC, psi_d, t); % Salida del sistema
psi_m = k_st * psi; % Ángulo medido

err = psi_d' - psi_m; % Error del controlador
w = cnt .* err; % Entrada al actuador
v_i = w * k_a; % Voltaje del motor