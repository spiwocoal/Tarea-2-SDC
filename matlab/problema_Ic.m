matrices;
T = 200e-3;

%% Ganancias del sistema
k_st = 180/pi; k_a = 100; k_c = 4e-3;

%% Lugar Geometrico de las Raices
sys_c = ss(A, B, C, 0);

z = tf('z', T);
sys = c2d(sys_c, T);
ret = 1/z; % Retardo por calculo
LaD = k_c * ret * k_a * sys * k_st; % Lazo Directo
LaA =  ret * k_c * k_a * sys;  % Lazo Abierto
LaC = feedback(LaA, k_st);  % Lazo Cerrado

%% Determinacion polos y ceros
[p_LaD, z_LaD] = pzmap(LaD);  % Lazo Directo
[p_LaC, z_LaC] = pzmap(LaC);  % Lazo Cerrado
disp('Polos del L.D:');
disp(p_LaD);
disp('Polos del L.C:');
disp(p_LaC);
disp('ceros del L.D:');
disp(z_LaD);
disp('ceros del L.C:');
disp(z_LaC);