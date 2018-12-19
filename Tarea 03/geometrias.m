% TEST_MN
% Testea el diagrama momento carga axial
close all;

% Define fierros
FI_12 = 6 * 6 * pi/100;
FI_10 = 5 * 5 * pi/100;
FI_8 = 4 * 4 * pi/100;

% cargar_puntos('M1Y');
if ~exist('datares', 'var')
    dataresd= readtable('resultados.txt','Delimiter','\t');
    datares=table2struct(dataresd);
end
ndt = size(dataresd);
ndt = ndt(1);

% ------------------------------------------------------------------------
% GEOMETRÍAS EJE Y
% ------------------------------------------------------------------------
[g1in, g1out] =     genera_diag_geom(37.5, 260,   390,   14, FI_12, FI_8, 'Geometría 1');   % M1Y, M3Y, M4Y, M5, M6Y, M8Y
cargar_piers({'M1Y', 'M3Y', 'M4Y', 'M5Y', 'M6Y', 'M8Y'}, g1in, g1out, dataresd, ndt);

[g2in, g2out] =     genera_diag_geom(37.5, 260,   225,   14, FI_12, FI_8, 'Geometría 2');   % M2Y, M7Y
cargar_piers({'M2Y', 'M7Y'}, g2in, g2out, dataresd, ndt);

% ------------------------------------------------------------------------
% GEOMETRÍAS EJE X
% ------------------------------------------------------------------------
[g3in, g3out] =     genera_diag_geom(37.5, 94.6,  330,   14, FI_12, FI_8, 'Geometría 3');   % M1X, M13X
cargar_piers({'M1X', 'M13X'}, g3in, g3out, dataresd, ndt);

[g4in, g4out] =     genera_diag_geom(37.5, 113.4, 112,   14, FI_10, FI_8, 'Geometría 4');   % M2X, M14X
cargar_piers({'M2X', 'M14X'}, g4in, g4out, dataresd, ndt);

[g5in, g5out] =     genera_diag_geom(37.5, 113.4, 98,    14, FI_10, FI_8, 'Geometría 5');   % M3X, M6X, M15X
cargar_piers({'M3X', 'M6X', 'M15X'}, g5in, g5out, dataresd, ndt);

[g6in, g6out] =     genera_diag_geom(37.5, 52,    330,   14, FI_12, FI_8, 'Geometría 6');   % M4X, M16X
cargar_piers({'M4X', 'M16X'}, g6in, g6out, dataresd, ndt);

[g7in, g7out] =     genera_diag_geom(37.5, 94.6,  382,   14, FI_12, FI_8, 'Geometría 7');   % M5X
cargar_piers({'M5X'}, g7in, g7out, dataresd, ndt);

[g8in, g8out] =     genera_diag_geom(37.5, 113.4, 164.5, 14, FI_10, FI_8, 'Geometría 8');   % M7X
cargar_piers({'M7X'}, g8in, g8out, dataresd, ndt);

[g9in, g9out] =     genera_diag_geom(37.5, 52,    510,   14, FI_12, FI_8, 'Geometría 9');   % M8X, M21X
cargar_piers({'M8X', 'M21X'}, g9in, g9out, dataresd, ndt);

[g10in, g10out] =   genera_diag_geom(37.5, 208,   37,    14, FI_12, FI_8, 'Geometría 10');  % M9X
cargar_piers({'M9X'}, g10in, g10out, dataresd, ndt);

[g11in, g11out] =   genera_diag_geom(37.5, 260,   232,   14, FI_12, FI_8, 'Geometría 11');  % M10X, M12X
cargar_piers({'M10X'}, g11in, g11out, dataresd, ndt);

[g12in, g12out] =   genera_diag_geom(37.5, 260,   277,   14, FI_12, FI_8, 'Geometría 12');  % M11X
cargar_piers({'M11X'}, g12in, g12out, dataresd, ndt);

[g13in, g13out] =   genera_diag_geom(37.5, 208,   97,    14, FI_12, FI_8, 'Geometría 13');  % M12X
cargar_piers({'M12X'}, g13in, g13out, dataresd, ndt);

[g14in, g14out] =   genera_diag_geom(37.5, 94.6,  322,   14, FI_12, FI_8, 'Geometría 14');  % M13X
cargar_piers({'M13X'}, g14in, g14out, dataresd, ndt);

[g15in, g15out] =   genera_diag_geom(37.5, 113.4, 164,   14, FI_10, FI_8, 'Geometría 15');  % M14X
cargar_piers({'M14X'}, g15in, g15out, dataresd, ndt);

[g16in, g16out] =   genera_diag_geom(37.5, 113.4, 37,    14, FI_10, FI_8, 'Geometría 16');  % M15X
cargar_piers({'M15X'}, g16in, g16out, dataresd, ndt);