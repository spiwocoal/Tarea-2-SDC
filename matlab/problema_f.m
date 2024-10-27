matrices;

%% Ganancias
k_st = 180/pi; k_a = 100;

sys = ss(A, B, C, 0);
LaD = k_a * sys; % Lazo Directo
kc_pos = 0;
kc_neg = 0;

%% Metodo iterativo
for kc = 0:1e-6:1
    LaD_kc_pos = kc*LaD;
    LaC_pos = feedback(LaD_kc_pos, k_st);
    polos_pos = pole(LaC_pos);

    if any(abs(real(polos_pos)) < 1e-4)
        kc_pos = kc;
        break;
    end
end

disp(kc_pos);

for kc = 0:-1e-6:-1
    LaD_kc_neg = kc*LaD;
    LaC_neg = feedback(LaD_kc_neg, k_st);
    polos_neg = pole(LaC_neg);
    
    if any(abs(real(polos_neg)) < 1e-4)
        kc_neg = kc;
        break;
    end
end

disp(kc_neg);