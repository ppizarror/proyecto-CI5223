function [m, n] = mn_caso3(Fm, t, b, N, kb, As, nps)
%MN_CASO3
alpha = fliplr(linspace(kb, 0.5, nps));
m = zeros(nps, 1);
n = zeros(nps, 1);
for i = 1:nps
    Cm = Fm * alpha(i) * t * b / 2;
    em = t / 2 - (alpha(i) * t) / 3;
    fs = N * (0.5 - alpha(i)) / alpha(i) * Fm;
    Ts = As * fs;
    n(i) = Cm - Ts;
    m(i) = Cm * em;
end
end