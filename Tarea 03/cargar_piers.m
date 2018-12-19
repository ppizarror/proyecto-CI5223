function cargar_piers(piers, figin, figout, dataresd, ndt)
npiers = length(piers);
styles = {'+', 'o', '*', '.', 'x', 's', 'd', 'v', '>', '<'};
for i=1:npiers
    cargar_puntos_ambos(piers{i}, dataresd, ndt, true, styles{i}, figin);
end
for i=1:npiers
    cargar_puntos_ambos(piers{i}, dataresd, ndt, false, styles{i}, figout);
end
end