function [m, n] = mn_caso2(Fm, b, t, d, nps, gamma)
%MN_CASO2 Calcula el caso 2
alpha = fliplr(linspace(1, b/d, nps));
m = zeros(nps, 1);
n = zeros(nps, 1);

for i = 1:nps
    n(i) = Fm * alpha(i) * t * d / 2;
    em = (d*(1+gamma) / 2 - (alpha(i) * d / 3));
    m(i) = n(i) * em;
end
end