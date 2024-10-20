matrices;

%% Ganancias del sistema
k_st = 180/pi; k_a = 100; k_c = 10e-3;

%% Sistema
cnt = k_c; % Controlador proporcional
sys = ss(A, B, C, 0);
LaD = cnt * k_a * sys * k_st; % Lazo Directo
aux_LaD = cnt * k_a * sys; 
% feedback(sys1, sys2) calcula sys1/(1 + sys1*sys2)
LaC = feedback(aux_LaD, k_st);  % Lazo Cerrado

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