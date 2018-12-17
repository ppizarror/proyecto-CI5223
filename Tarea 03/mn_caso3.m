function [m, n] = mn_caso3(Fm, t, d, N, kb, As, nps, gamma)
%MN_CASO3
alpha = fliplr(linspace(kb, 1, nps));
m = zeros(nps, 1);
n = zeros(nps, 1);
for i = 1:nps
    Cm = Fm * alpha(i) * t * d / 2;
    em = d * (1 + gamma) / 2 - (alpha(i) * d) / 3;
    es = (1 - gamma) * d / 2;
    fs = N * (1 - alpha(i)) / alpha(i) * Fm;
    Ts = As * fs;
    n(i) = Cm - Ts;
    m(i) = Cm * em + Ts * es;
end
end