% TEST_MN
% Testea el diagrama momento carga axial
close all;

% Calcula la interaccion
% gen_mn_muro(fm, h, t, l, Ae)
[m, n] = gen_mn_muro(80, 240, 14, 84, 7, 14, 0.502, false, true);
figure();
plot(m, n, 'k-', 'LineWidth', 1);
grid on;
grid minor;
xlabel('M (tonf-m)');
ylabel('N (tonf)');
title('Diagrama momento-carga axial');