% TEST_MN
% Testea el diagrama momento carga axial
close all;

% Calcula la interaccion
% plot_mn(fm, h, b, t, d, dp, As, aceroA44_28, geom)

plot_mn(40, 240, 84, 14, 77, 7, 0.503, true, 'Geometría 1');
plot_mn(80, 240, 14, 84, 7, 7, 0.503, true, 'Geometría 1'); % Fuera del plano

% plot_mn(38, 84, 620, 14, 613, 7, 1.1310, true, 'Geometría 1'); % G1
% plot_mn(38, 84, 14, 84, 7, 7, 0.503, true, 'Geometría 1'); % G1