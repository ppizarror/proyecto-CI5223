function cargar_puntos_ambos(pier, data, n, inplano, style, fig)
cargar_puntos(pier, data, n, inplano, style, [0, 0, 1], true, fig);
cargar_puntos(pier, data, n, inplano, style, [1, 0, 0], false, fig);
end