function [fin, fout] = genera_diag_int(fm, h, b, t, As_in, As_out, geom)
fin_n = strcat('muro/', strcat(lower(geom), '_in.eps'));
fout_n = strcat('muro/', strcat(lower(geom), '_out.eps'));
fin = plot_mn(fm, h, b, t, b-t/2, t/2, As_in, true, strcat(geom, ' - Eje en el plano'));
saveas(fin, fin_n, 'epsc');
fout = plot_mn(fm, h, t, b, t/2, t/2, As_out, true, strcat(geom, ' - Fuera del plano'));
saveas(fout, fout_n, 'epsc');
close(fin);
close(fout);
end