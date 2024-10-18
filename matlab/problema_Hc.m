matrices;

C = [1 0 0];

k_st = 180/pi; k_a = 100; k_c = 10e-3;

cnt = tf([k_c],[1 0]); % Controlador con integrador
sys = ss(A, B, C, 0);

LaD = cnt * k_a * sys * k_st; % Lazo Directo
aux_LaD = cnt * k_a * sys; 
% feedback(sys1, sys2) calcula sys1/(1 + sys1*sys2)
LaC = feedback(aux_LaD, k_st);  % Lazo Cerrado

% Pasamos a Función de Transferencia
FdT_LaD = tf(LaD);  % FdeT Lazo Directo
Fdt_LaC = tf(LaC);  % FdeT Lazo Cerrado

% polos y ceros 
[p_LaD, z_LaD] = pzmap(FdT_LaD);  % Polos y ceros del Lazo Directo
[p_LaC, z_LaC] = pzmap(Fdt_LaC);  % Polos y ceros del Lazo Cerrado
disp('Polos del L.D:');
disp(p_LaD);
disp('Polos del L.C:');
disp(p_LaC);
disp('ceros del L.D:');
disp(z_LaD);
disp('ceros del L.C:');
disp(z_LaC);