close all;
data = load('joint-displ.txt');
dx = data(:, 1);
dy = data(:, 2);

% Genera segun combinaciones
ppx = [];
ppy = [];
scx = [];
scy = [];
exx = [];
exy = [];
eyx = [];
eyy = [];
c1x = [];
c1y = [];
c2x = [];
c2y = [];
c31x = [];
c31y = [];
c32x = [];
c32y = [];
c41x = [];
c41y = [];
c42x = [];
c42y = [];

k = 1;
for i = 1:length(dx)
    k = mod(k+1, 14);
    if k == 1
        ppx(length(ppx)+1) = dx(i); %#ok<*SAGROW>
        ppy(length(ppy)+1) = dy(i);
    end
    if k == 2
        scx(length(scx)+1) = dx(i);
        scy(length(scy)+1) = dy(i);
    end
    if k == 3
        exx(length(exx)+1) = dx(i);
        exy(length(exy)+1) = dy(i);
    end
    if k == 4
        eyx(length(eyx)+1) = dx(i);
        eyy(length(eyy)+1) = dy(i);
    end
    if k == 5
        c1x(length(c1x)+1) = dx(i);
        c1y(length(c1y)+1) = dy(i);
    end
    if k == 6
        c2x(length(c2x)+1) = dx(i);
        c2y(length(c2y)+1) = dy(i);
    end
    if k == 7 || k == 8
        c31x(length(c31x)+1) = dx(i);
        c31y(length(c31y)+1) = dy(i);
    end
    if k == 9 || k == 10
        c32x(length(c32x)+1) = dx(i);
        c32y(length(c32y)+1) = dy(i);
    end
    if k == 11 || k == 12
        c41x(length(c41x)+1) = dx(i);
        c41y(length(c41y)+1) = dy(i);
    end
    if k == 13 || k == 14
        c42x(length(c42x)+1) = dx(i);
        c42y(length(c42y)+1) = dy(i);
    end
end

figure();
hold on;
% plot(dx, dy, '.', 'Color', [0, 0, 0]);
% {'+', '*', '.', 'x', 'o', 's', 'd', 'v', '>', '<'}

ps = '.';
ms = 8;

plot(c42x, c42y, ps, 'DisplayName', 'C4.2', 'MarkerSize', ms);
plot(c41x, c41y, ps, 'DisplayName', 'C4.1', 'MarkerSize', ms);
plot(c32x, c32y, ps, 'DisplayName', 'C3.2', 'MarkerSize', ms);
plot(c31x, c31y, ps, 'DisplayName', 'C3.1', 'MarkerSize', ms);
plot(c2x, c2y, ps, 'DisplayName', 'C2', 'MarkerSize', ms);
plot(c1x, c1y, ps, 'DisplayName', 'C1', 'MarkerSize', ms);
plot(eyx, eyy, ps, 'DisplayName', 'EY', 'MarkerSize', ms);
plot(exx, exy, ps, 'DisplayName', 'EX', 'MarkerSize', ms);
plot(scx, scy, ps, 'DisplayName', 'SC', 'MarkerSize', ms);
plot(ppx, ppy, ps, 'DisplayName', 'PP', 'MarkerSize', ms);

grid on;
grid minor;
xlabel('Desplazamiento eje x (cm)');
ylabel('Desplazamiento eje y (cm)');
title('Desplazamiento máximo de nodos');
legend('location', 'northeast');
xlim([-0.1, 0.1]);