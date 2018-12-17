function fig = plot_mn(fm, h, b, t, d, dp, As, aceroA44_28, geom)
%PLOT_MN Genera el grafico interaccion.
%
% Parametros:
%   fm              Resistencia prismatica de la alba�ileria (kgf/cm2)
%   h               Altura del muro (cm)
%   b               Largo del muro (cm)
%   t               Ancho del muro (cm)
%   d               Recubrimiento armadura (cm)
%   dp              d' (cm)
%   As              Area de las barras de acero (cm2)
%   aceroA44_28     Indica si usa el acero A44-28H o el A63-42H
%   geom            Nombre de la geometria

fig = figure();
hold on;
grid on;
grid minor;
xlabel('M (tonf-m)');
ylabel('N (tonf)');
title({'Diagrama interacci�n muro alba�iler�a', geom});

% Grafico sismico
[ms, ns] = gen_mn_muro(fm, h, b, t, d, dp, As, true, aceroA44_28);
plot(ms(1:end), ns(1:end), 'b-', 'LineWidth', 1);

% Grafico estatico
[me, ne] = gen_mn_muro(fm, h, b, t, d, dp, As, false, aceroA44_28);
plot(me(1:end), ne(1:end), 'r-', 'LineWidth', 1);

legend({'Din�mico', 'Est�tico'}, 'location', 'southeast');
ylim([0, max(yticks)]);
xlim([0, max(xticks)]);

end