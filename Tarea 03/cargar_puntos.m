function cargar_puntos(pier, data, n, inplano, style, color, sis, fig)
figure(fig);
ps = [];
ms = [];
j = 1;
for i = 1:n
    if strcmp(data(i, 2).Var2{1}, pier)
        comb = data(i, 3).Var3{1};
        p = abs(data(i, 5).Var5);
        if inplano
            m = abs(data(i, 10).Var10);
        else
            m = abs(data(i, 9).Var9);
        end
        if sis
            ps(j) = p; %#ok<*AGROW>
            ms(j) = m;
        else
            if strcmp(comb, 'PP') || strcmp(comb, 'SC') || strcmp(comb, 'ASD-C1') || ...
                    strcmp(comb, 'ASD-C2')
                ps(j) = p;
                ms(j) = m;
            end
        end
        j = j + 1;
    end
end

% Plotea los datos
if sis
    disname = strcat(pier, ' - Din�mico');
else
    disname = strcat(pier, ' - Est�tico');
end
plot(ms, ps, style, 'Color', color, 'DisplayName', disname);
end