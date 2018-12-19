function [fin, fout] = genera_diag_geom(fm, h, b, t, As_in, As_out, geom, outside)
if ~exist('outside', 'var')
    outside = true;
end
fin = plot_mn(fm, h, b, t, b-t/2, t/2, As_in, true, strcat(geom, ' - Eje en el plano'), outside);
fout = plot_mn(fm, h, t, b, t/2, t/2, As_out, true, strcat(geom, ' - Fuera del plano'), outside);
end