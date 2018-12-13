function [m, n] = mn_caso2(Fm, t, b, nps)
%MN_CASO2 Calcula el caso 2
alpha = fliplr(linspace(0.5, 1, nps));
m = zeros(nps, 1);
n = zeros(nps, 1);

for i = 1:nps
    n(i) = Fm * alpha(i) * t * b / 2;
    em = (t / 2 - (alpha(i) * t / 3));
    m(i) = n(i) * em;
end
end