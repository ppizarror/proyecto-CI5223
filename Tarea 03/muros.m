% TEST_MN
% Testea el diagrama momento carga axial
close all;

% Define fierros
FI_12 = 6 * 6 * pi/100;
FI_10 = 5 * 5 * pi/100;
FI_8 = 4 * 4 * pi/100;

genera_diag_int(37.5, 260, 390, 14, FI_12, FI_8, 'Muro1Y');
genera_diag_int(37.5, 260, 225, 14, FI_12, FI_8, 'Muro2Y');
genera_diag_int(37.5, 260, 390, 14, FI_12, FI_8, 'Muro3Y');
genera_diag_int(37.5, 260, 390, 14, FI_12, FI_8, 'Muro4Y');
genera_diag_int(37.5, 260, 390, 14, FI_12, FI_8, 'Muro5Y');
genera_diag_int(37.5, 260, 390, 14, FI_12, FI_8, 'Muro6Y');
genera_diag_int(37.5, 260, 225, 14, FI_12, FI_8, 'Muro7Y');
genera_diag_int(37.5, 260, 390, 14, FI_12, FI_8, 'Muro8Y');

genera_diag_int(37.5, 94.6,  330,   14, FI_12, FI_8, 'Muro1X');
genera_diag_int(37.5, 113.4, 112,   14, FI_10, FI_8, 'Muro2X');
genera_diag_int(37.5, 113.4, 98,    14, FI_10, FI_8, 'Muro3X');
genera_diag_int(37.5, 52,    330,   14, FI_12, FI_8, 'Muro4X');
genera_diag_int(37.5, 94.6,  382,   14, FI_12, FI_8, 'Muro5X');
genera_diag_int(37.5, 113.4, 98,    14, FI_10, FI_8, 'Muro6X');
genera_diag_int(37.5, 113.4, 164,   14, FI_10, FI_8, 'Muro7X');
genera_diag_int(37.5, 52,    510,   14, FI_12, FI_8, 'Muro8X');
genera_diag_int(37.5, 208,   37,    14, FI_12, FI_8, 'Muro9X');
genera_diag_int(37.5, 260,   232,   14, FI_12, FI_8, 'Muro10X');
genera_diag_int(37.5, 260,   277,   14, FI_12, FI_8, 'Muro11X');
genera_diag_int(37.5, 260,   232,   14, FI_12, FI_8, 'Muro12X');
genera_diag_int(37.5, 94.6,  330,   14, FI_12, FI_8, 'Muro13X');
genera_diag_int(37.5, 113.4, 112,   14, FI_10, FI_8, 'Muro14X');
genera_diag_int(37.5, 113.4, 98,    14, FI_10, FI_8, 'Muro15X');
genera_diag_int(37.5, 52,    330,   14, FI_12, FI_8, 'Muro16X');
genera_diag_int(37.5, 208,   97,    14, FI_12, FI_8, 'Muro17X');
genera_diag_int(37.5, 94.6,  322,   14, FI_12, FI_8, 'Muro18X');
genera_diag_int(37.5, 113.4, 164,   14, FI_10, FI_8, 'Muro19X');
genera_diag_int(37.5, 113.4, 37,    14, FI_10, FI_8, 'Muro20X');
genera_diag_int(37.5, 52,    510,   14, FI_12, FI_8, 'Muro21X');