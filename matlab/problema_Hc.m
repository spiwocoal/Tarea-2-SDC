matrices;

%% Ganancias del sistema
k_st = 180/pi; k_a = 100; k_c = 10e-3;

%% Sistema
s = tf("s");
cnt = k_c/s; % Controlador con integrador
sys = ss(A, B, C, 0);
LaD1 = cnt * k_a * sys * k_st; % Lazo Directo
LaD2 = cnt * k_a * sys;
LaC = feedback(LaD2, k_st);  % Lazo Cerrado

%% Determinacion polos y ceros
[p_LaD, z_LaD] = pzmap(LaD1); % Lazo Directo
[p_LaC, z_LaC] = pzmap(LaC);  % Lazo Cerrado
disp('Polos del L.D:');
disp(p_LaD);
disp('Polos del L.C:');
disp(p_LaC);
disp('ceros del L.D:');
disp(z_LaD);
disp('ceros del L.C:');
disp(z_LaC);