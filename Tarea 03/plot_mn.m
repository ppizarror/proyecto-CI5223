function fig = plot_mn(fm, h, b, t, d, dp, As, aceroA44_28, geom, outside)
%PLOT_MN Genera el grafico interaccion.
%
% Parametros:
%   fm              Resistencia prismatica de la albañileria (kgf/cm2)
%   h               Altura del muro (cm)
%   b               Largo del muro (cm)
%   t               Ancho del muro (cm)
%   d               Recubrimiento armadura (cm)
%   dp              d' (cm)
%   As              Area de las barras de acero (cm2)
%   aceroA44_28     Indica si usa el acero A44-28H o el A63-42H
%   geom            Nombre de la geometria
if ~exist('outside', 'var')
    outside = false;
end

fig = figure();
hold on;
grid on;
grid minor;
xlabel('M (tonf-m)');
ylabel('N (tonf)');
title({'Diagrama interacción muro albañilería', geom});

% Grafico sismico
[ms, ns] = gen_mn_muro(fm, h, b, t, d, dp, As, true, aceroA44_28);
plot(ms(1:end), ns(1:end), 'b-', 'LineWidth', 1, 'DisplayName', 'Dinámico');

% Grafico estatico
[me, ne] = gen_mn_muro(fm, h, b, t, d, dp, As, false, aceroA44_28);
plot(me(1:end), ne(1:end), 'r-', 'LineWidth', 1, 'DisplayName', 'Estático');

if outside
    legend('location', 'eastoutside');
    set(gca,'position',[0.1 0.1 0.59 0.8])
else
    legend('location', 'southeast');
end
ylim([0, max(yticks)]);
xlim([0, max(xticks)]);

end