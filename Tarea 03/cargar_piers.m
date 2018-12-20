function cargar_piers(piers, figin, figout, dataresd, ndt, geom)
npiers = length(piers);

% Dibuja
styles = {'+', 'o', '*', '.', 'x', 's', 'd', 'v', '>', '<'};
for i=1:npiers
    cargar_puntos_ambos(piers{i}, dataresd, ndt, true, styles{i}, figin);
end
for i=1:npiers
    cargar_puntos_ambos(piers{i}, dataresd, ndt, false, styles{i}, figout);
end

% Guarda el archivo
fin_n = strcat('geometria/', strcat(lower(geom), '_in.eps'));
fout_n = strcat('geometria/', strcat(lower(geom), '_out.eps'));
saveas(figin, fin_n, 'epsc');
saveas(figout, fout_n, 'epsc');

% Cierra
close(figin);
close(figout);

end