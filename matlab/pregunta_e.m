matrices;
syms s
syms kc real

%% Ganancias del sistema
k_st = 180/pi; k_a = 100;

%% Funcion de transferencia
sys = ss(A, B, C, 0);
LaD = k_st * k_a * sys; % Lazo Directo

%% Conversion a funcion simbolica
[num,den] = tfdata(LaD,'v');
LaD_syms = poly2sym(num,s)/poly2sym(den,s);

eq2 = 1 + kc * LaD_syms;
polos = solve(eq2 == 0, s, MaxDegree=3);

eq2 = real(polos(1)) == 10 * real(polos(2));
eq3 = real(polos(2)) == 10 * real(polos(1));

kc_orden1 = solve(eq2, kc);
kc_orden2 = solve(eq3, kc);

fprintf('kc1: %f\n', kc_orden1);
fprintf('kc2: %f\n', kc_orden2);