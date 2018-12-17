function fig = plot_mn(fm, h, t, b, d, As, aceroA44_28, geom)
%PLOT_MN Genera el grafico interaccion.
%
% Parametros:
%   fm              Resistencia prismatica de la albañileria (kgf/cm2)
%   h               Altura del muro (cm)
%   t               Ancho del muro (cm)
%   b               Largo del muro (cm)
%   d               Recubrimiento armadura (cm)
%   Ae              Area efectiva por unidad de largo (cm2/cm)
%   As              Area de las barras de acero (cm2)
%   aceroA44_28     Indica si usa el acero A44-28H o el A63-42H
%   geom            Nombre de la geometria

fig = figure();
hold on;
grid on;
grid minor;
xlabel('M (tonf-m)');
ylabel('N (tonf)');
title({'Diagrama interacción muro albañilería', geom});

% Grafico sismico
[ms, ns] = gen_mn_muro(fm, h, t, b, d, As, true, aceroA44_28);
plot(ms(2:end), ns(2:end), 'b-', 'LineWidth', 1);

% Grafico estatico
[me, ne] = gen_mn_muro(fm, h, t, b, d, As, false, aceroA44_28);
plot(me(2:end), ne(2:end), 'r-', 'LineWidth', 1);

% Grafica las otras componentes
plot(ms(1:2), ns(1:2), 'b--', 'LineWidth', 1);
plot(me(1:2), ne(1:2), 'r--', 'LineWidth', 1);

legend({'Dinámico', 'Estático'}, 'location', 'southeast');
ylim([0, max(yticks)]);

end