% TEST_MN
% Testea el diagrama momento carga axial
close all;

% Define fierros
FI_12 = 6 * 6 * pi/100;
FI_10 = 5 * 5 * pi/100;
FI_8 = 4 * 4 * pi/100;

[g1in, g1out] =     genera_diag_geom(37.5, 260,   390,   14, FI_12, FI_8, 'Geometría 1');   % M1Y, M3Y, M4Y, M5, M6Y, M8Y
[g2in, g2out] =     genera_diag_geom(37.5, 260,   225,   14, FI_12, FI_8, 'Geometría 2');   % M2Y, M7Y

[g3in, g3out] =     genera_diag_geom(37.5, 94.6,  330,   14, FI_12, FI_8, 'Geometría 3');   % M1X, M13X
[g4in, g4out] =     genera_diag_geom(37.5, 113.4, 112,   14, FI_10, FI_8, 'Geometría 4');   % M2X, M14X
[g5in, g5out] =     genera_diag_geom(37.5, 113.4, 98,    14, FI_10, FI_8, 'Geometría 5');   % M3X, M6X, M15X
[g6in, g6out] =     genera_diag_geom(37.5, 52,    330,   14, FI_12, FI_8, 'Geometría 6');   % M4X, M16X
[g7in, g7out] =     genera_diag_geom(37.5, 94.6,  382,   14, FI_12, FI_8, 'Geometría 7');   % M5X
[g8in, g8out] =     genera_diag_geom(37.5, 113.4, 164.5, 14, FI_10, FI_8, 'Geometría 8');   % M7X
[g9in, g9out] =     genera_diag_geom(37.5, 52,    510,   14, FI_12, FI_8, 'Geometría 9');   % M8X, M21X
[g10in, g10out] =   genera_diag_geom(37.5, 208,   37,    14, FI_12, FI_8, 'Geometría 10');  % M9X
[g11in, g11out] =   genera_diag_geom(37.5, 260,   232,   14, FI_12, FI_8, 'Geometría 11');  % M10X % M10X, M12X
[g12in, g12out] =   genera_diag_geom(37.5, 260,   277,   14, FI_12, FI_8, 'Geometría 12');  % M11X
[g13in, g13out] =   genera_diag_geom(37.5, 208,   97,    14, FI_12, FI_8, 'Geometría 13');  % M12X
[g14in, g14out] =   genera_diag_geom(37.5, 94.6,  322,   14, FI_12, FI_8, 'Geometría 14');  % M13X
[g15in, g15out] =   genera_diag_geom(37.5, 113.4, 164,   14, FI_10, FI_8, 'Geometría 15');  % M14X
[g16in, g16out] =   genera_diag_geom(37.5, 113.4, 37,    14, FI_10, FI_8, 'Geometría 16');  % M15X