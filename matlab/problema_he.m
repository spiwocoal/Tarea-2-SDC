matrices;
syms s
syms kc real

%% Ganancias del sistema
k_st = 180/pi; k_a = 100;

%% Funcion de transferencia
st = tf("s");
sys = ss(A, B, C, 0);
LaD = (1/st) * k_st * k_a * sys; % Lazo Directo

%% Conversion a funcion simbolica
[num,den] = tfdata(LaD,'v');
LaD_syms = poly2sym(num,s)/poly2sym(den,s);

eq1 = 1 + kc * LaD_syms;
polos = solve(eq1 == 0, s, MaxDegree=4);

eq2 = real(polos(1)) == 10 * real(polos(3));

kc_orden1 = vpasolve(eq2, kc);

fprintf('Ganancia para sistema de orden 1: %.4f\n', ...
    kc_orden1);